; DESCRIPTION: Composite: Renders a blue line between points (477, 84) and (419, 253) then Draws a blue rectangle at (430, 59) with width 21 and height 98.
; PLAN: r0=477(x1), r1=84(y1), r2=419(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=59(y), r7=21(width), r8=98(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 84
LDI r2, 419
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 59
LDI r7, 21
LDI r8, 98
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
