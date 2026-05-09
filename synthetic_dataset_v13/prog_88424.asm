; DESCRIPTION: Composite: Draws a red rectangle at (352, 80) with width 37 and height 106 then Draws a magenta line from (443, 97) to (223, 186).
; PLAN: r0=352(x), r1=80(y), r2=37(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=443(x1), r6=97(y1), r7=223(x2), r8=186(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 80
LDI r2, 37
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 97
LDI r7, 223
LDI r8, 186
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
