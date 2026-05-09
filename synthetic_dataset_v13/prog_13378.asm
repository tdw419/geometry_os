; DESCRIPTION: Composite: Places a white line segment connecting (201, 174) to (78, 129) then Creates a green rectangular region at (132, 84) spanning 79 by 83 pixels.
; PLAN: r0=201(x1), r1=174(y1), r2=78(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=84(y), r7=79(width), r8=83(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 201
LDI r1, 174
LDI r2, 78
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 84
LDI r7, 79
LDI r8, 83
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
