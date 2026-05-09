; DESCRIPTION: Composite: Creates a blue rectangular region at (310, 128) spanning 110 by 71 pixels then Draws a orange line from (418, 153) to (216, 243) then Renders a blue disk with center (215, 213) and radius 13.
; PLAN: r0=310(x), r1=128(y), r2=110(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x1), r6=153(y1), r7=216(x2), r8=243(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=213(y), r12=13(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 310
LDI r1, 128
LDI r2, 110
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 153
LDI r7, 216
LDI r8, 243
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 213
LDI r12, 13
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
