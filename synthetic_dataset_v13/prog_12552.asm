; DESCRIPTION: Composite: Renders a blue line between points (50, 102) and (96, 123) then Sets a single cyan pixel at (141, 100) then Places a purple 70x104 rectangle at position (111, 97).
; PLAN: r0=50(x1), r1=102(y1), r2=96(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=100(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=111(x), r11=97(y), r12=70(width), r13=104(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 102
LDI r2, 96
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 100
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 111
LDI r11, 97
LDI r12, 70
LDI r13, 104
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
