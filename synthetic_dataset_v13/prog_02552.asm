; DESCRIPTION: Composite: Places a red line segment connecting (316, 115) to (173, 120) then Places a cyan dot at position (208, 157) then Renders a purple box of size 99x106 starting at (161, 29).
; PLAN: r0=316(x1), r1=115(y1), r2=173(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=157(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=161(x), r11=29(y), r12=99(width), r13=106(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 115
LDI r2, 173
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 157
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 161
LDI r11, 29
LDI r12, 99
LDI r13, 106
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
