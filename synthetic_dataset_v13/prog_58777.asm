; DESCRIPTION: Composite: Renders a yellow line between points (450, 79) and (417, 15) then Places a red dot at position (34, 137) then Places a black 16x98 rectangle at position (76, 148).
; PLAN: r0=450(x1), r1=79(y1), r2=417(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=34(x), r6=137(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=76(x), r11=148(y), r12=16(width), r13=98(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 79
LDI r2, 417
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 137
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 76
LDI r11, 148
LDI r12, 16
LDI r13, 98
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
