; DESCRIPTION: Composite: Renders a green disk with center (97, 160) and radius 76 then Places a magenta dot at position (372, 65) then Creates a magenta rectangular region at (20, 44) spanning 20 by 119 pixels.
; PLAN: r0=97(x), r1=160(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=65(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=20(x), r11=44(y), r12=20(width), r13=119(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 160
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 65
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 20
LDI r11, 44
LDI r12, 20
LDI r13, 119
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
