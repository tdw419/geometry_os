; DESCRIPTION: Composite: Places a purple line segment connecting (383, 53) to (352, 99) then Renders a black disk with center (233, 93) and radius 77 then Creates a cyan rectangular region at (66, 11) spanning 101 by 67 pixels.
; PLAN: r0=383(x1), r1=53(y1), r2=352(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=93(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=66(x), r11=11(y), r12=101(width), r13=67(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 53
LDI r2, 352
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 93
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 66
LDI r11, 11
LDI r12, 101
LDI r13, 67
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
