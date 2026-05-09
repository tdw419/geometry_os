; DESCRIPTION: Composite: Renders a green disk with center (404, 87) and radius 66 then Renders a magenta box of size 11x108 starting at (46, 4) then Draws a black line from (478, 84) to (337, 203).
; PLAN: r0=404(x), r1=87(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=4(y), r7=11(width), r8=108(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=478(x1), r11=84(y1), r12=337(x2), r13=203(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 87
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 4
LDI r7, 11
LDI r8, 108
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 478
LDI r11, 84
LDI r12, 337
LDI r13, 203
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
