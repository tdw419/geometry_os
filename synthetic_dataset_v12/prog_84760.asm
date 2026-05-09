; DESCRIPTION: Composite: Creates a blue circular shape at (80, 70) with radius 67 then Places a blue dot at position (358, 108) then Draws a black line from (172, 99) to (160, 177).
; PLAN: r0=80(x), r1=70(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=108(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=172(x1), r11=99(y1), r12=160(x2), r13=177(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 70
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 108
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 172
LDI r11, 99
LDI r12, 160
LDI r13, 177
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
