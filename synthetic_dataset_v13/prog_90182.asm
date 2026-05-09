; DESCRIPTION: Composite: Creates a orange rectangular region at (288, 14) spanning 93 by 78 pixels then Draws a magenta line from (488, 254) to (103, 13) then Places a purple dot at position (207, 195).
; PLAN: r0=288(x), r1=14(y), r2=93(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x1), r6=254(y1), r7=103(x2), r8=13(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=207(x), r11=195(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 14
LDI r2, 93
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 254
LDI r7, 103
LDI r8, 13
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 195
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
