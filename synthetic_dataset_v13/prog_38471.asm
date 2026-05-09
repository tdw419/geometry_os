; DESCRIPTION: Composite: Draws a magenta line from (435, 105) to (185, 167) then Places a green 96x71 rectangle at position (95, 97).
; PLAN: r0=435(x1), r1=105(y1), r2=185(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=97(y), r7=96(width), r8=71(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 105
LDI r2, 185
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 97
LDI r7, 96
LDI r8, 71
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
