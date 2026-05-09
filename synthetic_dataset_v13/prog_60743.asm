; DESCRIPTION: Composite: Places a yellow dot at position (21, 123) then Renders a red box of size 21x43 starting at (170, 116) then Renders a blue disk with center (393, 148) and radius 29.
; PLAN: r0=21(x), r1=123(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=116(y), r7=21(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=393(x), r11=148(y), r12=29(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 123
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 170
LDI r6, 116
LDI r7, 21
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 148
LDI r12, 29
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
