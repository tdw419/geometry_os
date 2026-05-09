; DESCRIPTION: Composite: Renders a purple disk with center (128, 192) and radius 59 then Renders a black box of size 58x108 starting at (357, 67) then Draws a black line from (383, 190) to (364, 246).
; PLAN: r0=128(x), r1=192(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=67(y), r7=58(width), r8=108(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x1), r11=190(y1), r12=364(x2), r13=246(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 192
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 67
LDI r7, 58
LDI r8, 108
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 190
LDI r12, 364
LDI r13, 246
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
