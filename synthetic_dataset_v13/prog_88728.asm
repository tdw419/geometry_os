; DESCRIPTION: Composite: Draws a red rectangle at (98, 39) with width 99 and height 74 then Renders a red line between points (12, 133) and (396, 126).
; PLAN: r0=98(x), r1=39(y), r2=99(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x1), r6=133(y1), r7=396(x2), r8=126(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 39
LDI r2, 99
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 133
LDI r7, 396
LDI r8, 126
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
