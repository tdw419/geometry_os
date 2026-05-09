; DESCRIPTION: Composite: Places a blue line segment connecting (473, 157) to (362, 236) then Creates a yellow rectangular region at (129, 115) spanning 51 by 69 pixels.
; PLAN: r0=473(x1), r1=157(y1), r2=362(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=115(y), r7=51(width), r8=69(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 157
LDI r2, 362
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 115
LDI r7, 51
LDI r8, 69
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
