; DESCRIPTION: Composite: Renders a white line between points (440, 200) and (8, 124) then Draws a orange rectangle at (296, 86) with width 112 and height 77.
; PLAN: r0=440(x1), r1=200(y1), r2=8(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=86(y), r7=112(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 200
LDI r2, 8
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 86
LDI r7, 112
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
