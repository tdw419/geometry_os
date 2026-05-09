; DESCRIPTION: Composite: Creates a yellow rectangular region at (423, 16) spanning 72 by 53 pixels then Places a black dot at position (433, 9) then Places a purple line segment connecting (82, 227) to (437, 242).
; PLAN: r0=423(x), r1=16(y), r2=72(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=9(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=82(x1), r11=227(y1), r12=437(x2), r13=242(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 16
LDI r2, 72
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 9
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 82
LDI r11, 227
LDI r12, 437
LDI r13, 242
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
