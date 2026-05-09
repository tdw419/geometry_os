; DESCRIPTION: Composite: Renders a red disk with center (105, 103) and radius 64 then Renders a yellow box of size 49x26 starting at (324, 46) then Sets a single magenta pixel at (25, 185).
; PLAN: r0=105(x), r1=103(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x), r6=46(y), r7=49(width), r8=26(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=25(x), r11=185(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 103
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 46
LDI r7, 49
LDI r8, 26
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 25
LDI r11, 185
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
