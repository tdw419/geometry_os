; DESCRIPTION: Composite: Places a yellow dot at position (437, 118) then Places a white 73x37 rectangle at position (133, 73) then Draws a red line from (162, 194) to (187, 212).
; PLAN: r0=437(x), r1=118(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=73(y), r7=73(width), r8=37(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x1), r11=194(y1), r12=187(x2), r13=212(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 118
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 133
LDI r6, 73
LDI r7, 73
LDI r8, 37
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 194
LDI r12, 187
LDI r13, 212
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
