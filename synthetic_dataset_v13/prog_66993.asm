; DESCRIPTION: Composite: Renders a magenta line between points (144, 251) and (306, 179) then Renders a red box of size 45x114 starting at (198, 114) then Places a black dot at position (300, 126).
; PLAN: r0=144(x1), r1=251(y1), r2=306(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=114(y), r7=45(width), r8=114(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=300(x), r11=126(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 144
LDI r1, 251
LDI r2, 306
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 114
LDI r7, 45
LDI r8, 114
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 126
LDI r12, 0x000000
PSET r10, r11, r12
HALT
