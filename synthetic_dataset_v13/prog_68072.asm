; DESCRIPTION: Composite: Places a purple dot at position (392, 10) then Places a green line segment connecting (188, 241) to (468, 249) then Renders a black box of size 97x87 starting at (301, 88).
; PLAN: r0=392(x), r1=10(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=188(x1), r6=241(y1), r7=468(x2), r8=249(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=301(x), r11=88(y), r12=97(width), r13=87(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 10
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 188
LDI r6, 241
LDI r7, 468
LDI r8, 249
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 88
LDI r12, 97
LDI r13, 87
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
