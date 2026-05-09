; DESCRIPTION: Composite: Draws a green rectangle at (113, 6) with width 31 and height 112 then Renders a green line between points (115, 12) and (162, 13).
; PLAN: r0=113(x), r1=6(y), r2=31(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x1), r6=12(y1), r7=162(x2), r8=13(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 6
LDI r2, 31
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 12
LDI r7, 162
LDI r8, 13
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
