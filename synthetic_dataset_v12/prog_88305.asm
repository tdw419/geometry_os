; DESCRIPTION: Composite: Renders a blue box of size 94x109 starting at (339, 54) then Draws a white line from (400, 113) to (78, 229).
; PLAN: r0=339(x), r1=54(y), r2=94(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=113(y1), r7=78(x2), r8=229(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 54
LDI r2, 94
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 113
LDI r7, 78
LDI r8, 229
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
