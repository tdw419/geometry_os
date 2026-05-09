; DESCRIPTION: Composite: Places a green circle of radius 80 at center (142, 116) then Places a cyan dot at position (25, 200) then Creates a purple rectangular region at (423, 138) spanning 21 by 33 pixels.
; PLAN: r0=142(x), r1=116(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=25(x), r6=200(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=423(x), r11=138(y), r12=21(width), r13=33(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 116
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 25
LDI r6, 200
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 423
LDI r11, 138
LDI r12, 21
LDI r13, 33
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
