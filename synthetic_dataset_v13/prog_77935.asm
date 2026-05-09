; DESCRIPTION: Composite: Places a white dot at position (468, 144) then Places a magenta circle of radius 24 at center (448, 142) then Renders a red box of size 10x22 starting at (419, 33).
; PLAN: r0=468(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=448(x), r6=142(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x), r11=33(y), r12=10(width), r13=22(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 468
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 448
LDI r6, 142
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 33
LDI r12, 10
LDI r13, 22
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
