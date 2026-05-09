; DESCRIPTION: Composite: Creates a blue rectangular region at (297, 97) spanning 55 by 117 pixels then Draws a black line from (291, 126) to (338, 202) then Places a magenta dot at position (352, 66).
; PLAN: r0=297(x), r1=97(y), r2=55(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x1), r6=126(y1), r7=338(x2), r8=202(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=352(x), r11=66(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 297
LDI r1, 97
LDI r2, 55
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 126
LDI r7, 338
LDI r8, 202
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 66
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
