; DESCRIPTION: Composite: Draws a magenta rectangle at (82, 76) with width 87 and height 93 then Draws a white line from (14, 19) to (232, 54).
; PLAN: r0=82(x), r1=76(y), r2=87(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x1), r6=19(y1), r7=232(x2), r8=54(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 76
LDI r2, 87
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 19
LDI r7, 232
LDI r8, 54
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
