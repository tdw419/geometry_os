; DESCRIPTION: Composite: Draws a black rectangle at (45, 195) with width 117 and height 30 then Draws a black line from (79, 221) to (260, 205).
; PLAN: r0=45(x), r1=195(y), r2=117(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x1), r6=221(y1), r7=260(x2), r8=205(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 195
LDI r2, 117
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 221
LDI r7, 260
LDI r8, 205
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
