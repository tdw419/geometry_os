; DESCRIPTION: Composite: Creates a orange circular shape at (96, 193) with radius 33 then Places a black dot at position (188, 143) then Renders a green line between points (435, 185) and (503, 152).
; PLAN: r0=96(x), r1=193(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=143(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=435(x1), r11=185(y1), r12=503(x2), r13=152(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 193
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 143
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 435
LDI r11, 185
LDI r12, 503
LDI r13, 152
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
