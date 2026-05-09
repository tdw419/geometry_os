; DESCRIPTION: Composite: Places a white line segment connecting (34, 136) to (13, 220) then Creates a black rectangular region at (83, 10) spanning 86 by 115 pixels.
; PLAN: r0=34(x1), r1=136(y1), r2=13(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=10(y), r7=86(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 136
LDI r2, 13
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 10
LDI r7, 86
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
