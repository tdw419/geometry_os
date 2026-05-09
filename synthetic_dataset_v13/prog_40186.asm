; DESCRIPTION: Composite: Renders a black line between points (336, 115) and (149, 229) then Draws a cyan rectangle at (207, 94) with width 100 and height 113.
; PLAN: r0=336(x1), r1=115(y1), r2=149(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=94(y), r7=100(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 115
LDI r2, 149
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 94
LDI r7, 100
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
