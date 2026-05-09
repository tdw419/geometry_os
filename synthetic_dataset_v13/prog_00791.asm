; DESCRIPTION: Composite: Renders a blue line between points (484, 16) and (509, 57) then Places a blue dot at position (173, 56) then Creates a red circular shape at (387, 188) with radius 59.
; PLAN: r0=484(x1), r1=16(y1), r2=509(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=56(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=387(x), r11=188(y), r12=59(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 484
LDI r1, 16
LDI r2, 509
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 56
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 387
LDI r11, 188
LDI r12, 59
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
