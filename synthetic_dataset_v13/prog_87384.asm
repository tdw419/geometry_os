; DESCRIPTION: Composite: Draws a white line from (472, 129) to (299, 2) then Places a yellow dot at position (249, 70) then Creates a orange circular shape at (271, 97) with radius 32.
; PLAN: r0=472(x1), r1=129(y1), r2=299(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=70(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=271(x), r11=97(y), r12=32(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 472
LDI r1, 129
LDI r2, 299
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 70
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 271
LDI r11, 97
LDI r12, 32
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
