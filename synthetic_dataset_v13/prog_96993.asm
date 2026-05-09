; DESCRIPTION: Composite: Places a blue line segment connecting (351, 66) to (51, 67) then Places a cyan dot at position (495, 230) then Creates a yellow rectangular region at (92, 132) spanning 21 by 25 pixels.
; PLAN: r0=351(x1), r1=66(y1), r2=51(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=495(x), r6=230(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=92(x), r11=132(y), r12=21(width), r13=25(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 66
LDI r2, 51
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 230
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 92
LDI r11, 132
LDI r12, 21
LDI r13, 25
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
