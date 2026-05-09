; DESCRIPTION: Composite: Draws a red rectangle at (42, 115) with width 81 and height 17 then Renders a purple line between points (207, 152) and (175, 112).
; PLAN: r0=42(x), r1=115(y), r2=81(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=152(y1), r7=175(x2), r8=112(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 115
LDI r2, 81
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 152
LDI r7, 175
LDI r8, 112
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
