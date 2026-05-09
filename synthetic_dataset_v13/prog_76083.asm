; DESCRIPTION: Composite: Places a purple dot at position (397, 22) then Places a green line segment connecting (55, 98) to (259, 84) then Renders a magenta box of size 95x53 starting at (366, 149).
; PLAN: r0=397(x), r1=22(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=55(x1), r6=98(y1), r7=259(x2), r8=84(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=149(y), r12=95(width), r13=53(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 22
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 55
LDI r6, 98
LDI r7, 259
LDI r8, 84
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 149
LDI r12, 95
LDI r13, 53
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
