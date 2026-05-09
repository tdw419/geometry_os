; DESCRIPTION: Composite: Creates a green circular shape at (283, 140) with radius 67 then Places a blue dot at position (323, 115) then Creates a blue rectangular region at (410, 162) spanning 46 by 68 pixels.
; PLAN: r0=283(x), r1=140(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=115(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=410(x), r11=162(y), r12=46(width), r13=68(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 140
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 115
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 410
LDI r11, 162
LDI r12, 46
LDI r13, 68
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
