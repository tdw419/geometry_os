; DESCRIPTION: Composite: Places a yellow 92x79 rectangle at position (364, 87) then Renders a black line between points (16, 135) and (411, 134) then Sets a single white pixel at (105, 156).
; PLAN: r0=364(x), r1=87(y), r2=92(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x1), r6=135(y1), r7=411(x2), r8=134(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=156(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 364
LDI r1, 87
LDI r2, 92
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 135
LDI r7, 411
LDI r8, 134
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 156
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
