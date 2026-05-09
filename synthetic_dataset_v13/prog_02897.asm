; DESCRIPTION: Composite: Places a white line segment connecting (68, 21) to (275, 244) then Places a orange dot at position (146, 117) then Renders a white disk with center (173, 198) and radius 27.
; PLAN: r0=68(x1), r1=21(y1), r2=275(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=117(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=173(x), r11=198(y), r12=27(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 68
LDI r1, 21
LDI r2, 275
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 117
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 173
LDI r11, 198
LDI r12, 27
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
