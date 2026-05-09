; DESCRIPTION: Composite: Renders a green line between points (381, 60) and (450, 31) then Draws a blue rectangle at (175, 82) with width 19 and height 85.
; PLAN: r0=381(x1), r1=60(y1), r2=450(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=82(y), r7=19(width), r8=85(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 60
LDI r2, 450
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 82
LDI r7, 19
LDI r8, 85
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
