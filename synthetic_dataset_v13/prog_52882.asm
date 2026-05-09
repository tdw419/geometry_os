; DESCRIPTION: Composite: Creates a black rectangular region at (399, 93) spanning 73 by 117 pixels then Draws a red line from (356, 147) to (337, 174) then Places a black dot at position (256, 84).
; PLAN: r0=399(x), r1=93(y), r2=73(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x1), r6=147(y1), r7=337(x2), r8=174(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=84(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 399
LDI r1, 93
LDI r2, 73
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 147
LDI r7, 337
LDI r8, 174
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 84
LDI r12, 0x000000
PSET r10, r11, r12
HALT
