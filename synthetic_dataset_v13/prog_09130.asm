; DESCRIPTION: Composite: Creates a yellow circular shape at (154, 203) with radius 31 then Sets a single green pixel at (236, 171) then Places a yellow line segment connecting (406, 142) to (416, 79).
; PLAN: r0=154(x), r1=203(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=236(x), r6=171(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=406(x1), r11=142(y1), r12=416(x2), r13=79(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 203
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 236
LDI r6, 171
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 406
LDI r11, 142
LDI r12, 416
LDI r13, 79
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
