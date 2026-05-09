; DESCRIPTION: Composite: Renders a orange box of size 71x11 starting at (315, 131) then Renders a purple line between points (60, 243) and (354, 56) then Places a purple circle of radius 16 at center (237, 121).
; PLAN: r0=315(x), r1=131(y), r2=71(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x1), r6=243(y1), r7=354(x2), r8=56(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=121(y), r12=16(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 315
LDI r1, 131
LDI r2, 71
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 243
LDI r7, 354
LDI r8, 56
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 121
LDI r12, 16
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
