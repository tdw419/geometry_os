; DESCRIPTION: Composite: Places a orange line segment connecting (152, 48) to (437, 30) then Creates a white rectangular region at (241, 32) spanning 105 by 89 pixels.
; PLAN: r0=152(x1), r1=48(y1), r2=437(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=32(y), r7=105(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 48
LDI r2, 437
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 32
LDI r7, 105
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
