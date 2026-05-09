; DESCRIPTION: Composite: Places a white dot at position (36, 215) then Places a magenta circle of radius 21 at center (173, 187).
; PLAN: r0=36(x), r1=215(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=187(y), r7=21(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 36
LDI r1, 215
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 173
LDI r6, 187
LDI r7, 21
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
