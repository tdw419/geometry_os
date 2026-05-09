; DESCRIPTION: Composite: Draws a cyan rectangle at (423, 232) with width 25 and height 16 then Renders a red line between points (122, 202) and (364, 196).
; PLAN: r0=423(x), r1=232(y), r2=25(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x1), r6=202(y1), r7=364(x2), r8=196(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 232
LDI r2, 25
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 202
LDI r7, 364
LDI r8, 196
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
