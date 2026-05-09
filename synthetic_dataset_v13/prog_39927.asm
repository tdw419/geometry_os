; DESCRIPTION: Composite: Sets a single green pixel at (69, 132) then Creates a yellow rectangular region at (45, 112) spanning 51 by 40 pixels then Places a blue line segment connecting (106, 95) to (473, 108).
; PLAN: r0=69(x), r1=132(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=45(x), r6=112(y), r7=51(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=106(x1), r11=95(y1), r12=473(x2), r13=108(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 132
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 45
LDI r6, 112
LDI r7, 51
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 95
LDI r12, 473
LDI r13, 108
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
