; DESCRIPTION: Composite: Places a purple 109x93 rectangle at position (22, 126) then Draws a green line from (497, 125) to (236, 15).
; PLAN: r0=22(x), r1=126(y), r2=109(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=497(x1), r6=125(y1), r7=236(x2), r8=15(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 22
LDI r1, 126
LDI r2, 109
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 125
LDI r7, 236
LDI r8, 15
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
