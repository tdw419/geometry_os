; DESCRIPTION: Composite: Draws a purple line from (25, 202) to (221, 195) then Renders a yellow box of size 18x118 starting at (32, 93).
; PLAN: r0=25(x1), r1=202(y1), r2=221(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=93(y), r7=18(width), r8=118(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 202
LDI r2, 221
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 93
LDI r7, 18
LDI r8, 118
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
