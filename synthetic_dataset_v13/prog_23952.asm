; DESCRIPTION: Composite: Sets a single purple pixel at (401, 93) then Places a magenta circle of radius 38 at center (366, 50) then Renders a red box of size 10x96 starting at (474, 27).
; PLAN: r0=401(x), r1=93(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=50(y), r7=38(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=474(x), r11=27(y), r12=10(width), r13=96(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 93
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 366
LDI r6, 50
LDI r7, 38
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 474
LDI r11, 27
LDI r12, 10
LDI r13, 96
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
