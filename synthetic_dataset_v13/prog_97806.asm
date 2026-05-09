; DESCRIPTION: Composite: Creates a blue rectangular region at (359, 9) spanning 120 by 59 pixels then Renders a orange line between points (329, 51) and (283, 11).
; PLAN: r0=359(x), r1=9(y), r2=120(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x1), r6=51(y1), r7=283(x2), r8=11(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 9
LDI r2, 120
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 51
LDI r7, 283
LDI r8, 11
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
