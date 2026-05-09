; DESCRIPTION: Composite: Renders a black box of size 88x112 starting at (282, 103) then Places a orange circle of radius 11 at center (202, 222) then Places a green dot at position (317, 238).
; PLAN: r0=282(x), r1=103(y), r2=88(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x), r6=222(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=317(x), r11=238(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 282
LDI r1, 103
LDI r2, 88
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 222
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 317
LDI r11, 238
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
