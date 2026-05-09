; DESCRIPTION: Composite: Places a white line segment connecting (200, 17) to (389, 66) then Creates a orange rectangular region at (125, 94) spanning 82 by 28 pixels.
; PLAN: r0=200(x1), r1=17(y1), r2=389(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=94(y), r7=82(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 17
LDI r2, 389
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 94
LDI r7, 82
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
