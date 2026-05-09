; DESCRIPTION: Composite: Places a yellow line segment connecting (420, 176) to (208, 52) then Creates a white rectangular region at (183, 122) spanning 48 by 120 pixels.
; PLAN: r0=420(x1), r1=176(y1), r2=208(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=122(y), r7=48(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 176
LDI r2, 208
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 122
LDI r7, 48
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
