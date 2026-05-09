; DESCRIPTION: Composite: Places a white line segment connecting (106, 26) to (359, 199) then Creates a white rectangular region at (71, 30) spanning 113 by 74 pixels.
; PLAN: r0=106(x1), r1=26(y1), r2=359(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=30(y), r7=113(width), r8=74(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 26
LDI r2, 359
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 30
LDI r7, 113
LDI r8, 74
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
