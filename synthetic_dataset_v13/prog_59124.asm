; DESCRIPTION: Composite: Draws a cyan circle centered at (86, 45) with radius 45 then Renders a orange box of size 39x119 starting at (170, 52) then Places a orange line segment connecting (341, 227) to (324, 247).
; PLAN: r0=86(x), r1=45(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=52(y), r7=39(width), r8=119(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=341(x1), r11=227(y1), r12=324(x2), r13=247(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 45
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 52
LDI r7, 39
LDI r8, 119
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 227
LDI r12, 324
LDI r13, 247
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
