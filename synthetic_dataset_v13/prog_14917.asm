; DESCRIPTION: Composite: Renders a blue line between points (249, 142) and (101, 84) then Creates a green rectangular region at (137, 25) spanning 45 by 62 pixels.
; PLAN: r0=249(x1), r1=142(y1), r2=101(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=25(y), r7=45(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 142
LDI r2, 101
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 25
LDI r7, 45
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
