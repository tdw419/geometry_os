; DESCRIPTION: Composite: Sets a single purple pixel at (288, 200) then Places a magenta circle of radius 28 at center (214, 180).
; PLAN: r0=288(x), r1=200(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=180(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 200
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 214
LDI r6, 180
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
