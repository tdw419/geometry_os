; DESCRIPTION: Composite: Places a black dot at position (81, 194) then Creates a cyan rectangular region at (322, 101) spanning 95 by 95 pixels then Draws a red line from (260, 32) to (4, 117).
; PLAN: r0=81(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=101(y), r7=95(width), r8=95(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x1), r11=32(y1), r12=4(x2), r13=117(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 194
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 322
LDI r6, 101
LDI r7, 95
LDI r8, 95
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 32
LDI r12, 4
LDI r13, 117
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
