; DESCRIPTION: Composite: Renders a purple box of size 58x20 starting at (412, 46) then Renders a white line between points (394, 23) and (53, 254) then Renders a blue disk with center (395, 63) and radius 39.
; PLAN: r0=412(x), r1=46(y), r2=58(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x1), r6=23(y1), r7=53(x2), r8=254(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=63(y), r12=39(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 412
LDI r1, 46
LDI r2, 58
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 23
LDI r7, 53
LDI r8, 254
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 63
LDI r12, 39
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
