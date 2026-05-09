; DESCRIPTION: Composite: Renders a white line between points (229, 51) and (451, 104) then Draws a blue rectangle at (320, 26) with width 24 and height 38.
; PLAN: r0=229(x1), r1=51(y1), r2=451(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=26(y), r7=24(width), r8=38(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 51
LDI r2, 451
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 26
LDI r7, 24
LDI r8, 38
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
