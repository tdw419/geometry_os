; DESCRIPTION: Composite: Places a purple dot at position (484, 189) then Renders a green disk with center (313, 193) and radius 33 then Draws a white line from (76, 28) to (80, 166).
; PLAN: r0=484(x), r1=189(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=313(x), r6=193(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x1), r11=28(y1), r12=80(x2), r13=166(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 484
LDI r1, 189
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 313
LDI r6, 193
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 28
LDI r12, 80
LDI r13, 166
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
