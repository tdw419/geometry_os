; DESCRIPTION: Composite: Places a yellow 47x37 rectangle at position (334, 162) then Places a black dot at position (161, 253) then Draws a blue line from (183, 190) to (91, 90).
; PLAN: r0=334(x), r1=162(y), r2=47(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x), r6=253(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=183(x1), r11=190(y1), r12=91(x2), r13=90(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 162
LDI r2, 47
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 253
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 183
LDI r11, 190
LDI r12, 91
LDI r13, 90
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
