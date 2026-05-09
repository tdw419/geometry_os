; DESCRIPTION: Composite: Renders a yellow disk with center (265, 165) and radius 39 then Places a cyan line segment connecting (78, 66) to (237, 50) then Creates a black rectangular region at (394, 33) spanning 50 by 103 pixels.
; PLAN: r0=265(x), r1=165(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x1), r6=66(y1), r7=237(x2), r8=50(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=33(y), r12=50(width), r13=103(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 165
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 66
LDI r7, 237
LDI r8, 50
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 33
LDI r12, 50
LDI r13, 103
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
