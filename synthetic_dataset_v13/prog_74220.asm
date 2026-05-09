; DESCRIPTION: Composite: Sets a single magenta pixel at (282, 127) then Creates a purple rectangular region at (152, 118) spanning 101 by 50 pixels then Places a blue line segment connecting (54, 37) to (456, 120).
; PLAN: r0=282(x), r1=127(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=152(x), r6=118(y), r7=101(width), r8=50(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=54(x1), r11=37(y1), r12=456(x2), r13=120(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 127
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 118
LDI r7, 101
LDI r8, 50
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 37
LDI r12, 456
LDI r13, 120
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
