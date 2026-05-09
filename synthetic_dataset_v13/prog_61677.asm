; DESCRIPTION: Composite: Draws a black line from (94, 142) to (361, 67) then Creates a green rectangular region at (299, 13) spanning 85 by 69 pixels then Renders a cyan disk with center (351, 187) and radius 21.
; PLAN: r0=94(x1), r1=142(y1), r2=361(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=299(x), r6=13(y), r7=85(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=351(x), r11=187(y), r12=21(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 142
LDI r2, 361
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 13
LDI r7, 85
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 187
LDI r12, 21
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
