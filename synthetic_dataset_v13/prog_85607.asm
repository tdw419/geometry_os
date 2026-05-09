; DESCRIPTION: Composite: Draws a cyan line from (153, 89) to (136, 211) then Places a black dot at position (96, 71) then Places a orange 103x116 rectangle at position (156, 44).
; PLAN: r0=153(x1), r1=89(y1), r2=136(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=71(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=156(x), r11=44(y), r12=103(width), r13=116(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 89
LDI r2, 136
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 71
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 156
LDI r11, 44
LDI r12, 103
LDI r13, 116
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
