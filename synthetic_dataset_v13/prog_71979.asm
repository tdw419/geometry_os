; DESCRIPTION: Composite: Draws a cyan rectangle at (115, 155) with width 72 and height 57 then Renders a green line between points (444, 220) and (8, 217).
; PLAN: r0=115(x), r1=155(y), r2=72(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x1), r6=220(y1), r7=8(x2), r8=217(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 115
LDI r1, 155
LDI r2, 72
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 220
LDI r7, 8
LDI r8, 217
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
