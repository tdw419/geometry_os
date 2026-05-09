; DESCRIPTION: Composite: Creates a green circular shape at (239, 95) with radius 49 then Places a orange dot at position (204, 244) then Draws a red line from (140, 30) to (160, 108).
; PLAN: r0=239(x), r1=95(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=244(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=140(x1), r11=30(y1), r12=160(x2), r13=108(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 95
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 244
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 140
LDI r11, 30
LDI r12, 160
LDI r13, 108
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
