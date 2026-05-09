; DESCRIPTION: Composite: Creates a green rectangular region at (218, 125) spanning 18 by 84 pixels then Renders a orange line between points (32, 5) and (409, 213).
; PLAN: r0=218(x), r1=125(y), r2=18(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x1), r6=5(y1), r7=409(x2), r8=213(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 125
LDI r2, 18
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 5
LDI r7, 409
LDI r8, 213
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
