; DESCRIPTION: Composite: Renders a orange disk with center (354, 55) and radius 21 then Sets a single cyan pixel at (169, 227) then Places a orange line segment connecting (150, 72) to (196, 205).
; PLAN: r0=354(x), r1=55(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x), r6=227(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=150(x1), r11=72(y1), r12=196(x2), r13=205(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 55
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 227
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 150
LDI r11, 72
LDI r12, 196
LDI r13, 205
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
