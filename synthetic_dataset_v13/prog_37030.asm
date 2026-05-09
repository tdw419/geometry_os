; DESCRIPTION: Composite: Places a red dot at position (30, 113) then Draws a cyan line from (126, 80) to (179, 30) then Renders a yellow box of size 108x43 starting at (316, 195).
; PLAN: r0=30(x), r1=113(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=126(x1), r6=80(y1), r7=179(x2), r8=30(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=316(x), r11=195(y), r12=108(width), r13=43(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 113
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 126
LDI r6, 80
LDI r7, 179
LDI r8, 30
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 316
LDI r11, 195
LDI r12, 108
LDI r13, 43
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
