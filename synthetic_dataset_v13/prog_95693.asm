; DESCRIPTION: Composite: Renders a yellow disk with center (261, 195) and radius 46 then Sets a single magenta pixel at (149, 85) then Renders a green box of size 120x22 starting at (249, 99).
; PLAN: r0=261(x), r1=195(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x), r6=85(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=249(x), r11=99(y), r12=120(width), r13=22(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 195
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 85
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 249
LDI r11, 99
LDI r12, 120
LDI r13, 22
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
