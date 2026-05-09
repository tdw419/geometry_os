; DESCRIPTION: Composite: Renders a cyan disk with center (240, 139) and radius 78 then Places a purple dot at position (69, 68) then Places a cyan line segment connecting (123, 170) to (205, 108).
; PLAN: r0=240(x), r1=139(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=68(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=123(x1), r11=170(y1), r12=205(x2), r13=108(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 139
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 68
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 123
LDI r11, 170
LDI r12, 205
LDI r13, 108
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
