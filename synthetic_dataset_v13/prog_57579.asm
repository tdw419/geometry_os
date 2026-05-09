; DESCRIPTION: Composite: Places a yellow dot at position (34, 7) then Renders a blue disk with center (423, 36) and radius 10 then Creates a purple rectangular region at (23, 62) spanning 59 by 49 pixels.
; PLAN: r0=34(x), r1=7(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=423(x), r6=36(y), r7=10(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=23(x), r11=62(y), r12=59(width), r13=49(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 7
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 423
LDI r6, 36
LDI r7, 10
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 23
LDI r11, 62
LDI r12, 59
LDI r13, 49
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
