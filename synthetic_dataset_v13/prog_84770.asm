; DESCRIPTION: Composite: Creates a orange circular shape at (440, 76) with radius 56 then Places a blue dot at position (330, 79) then Places a orange line segment connecting (217, 49) to (111, 146).
; PLAN: r0=440(x), r1=76(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=79(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=217(x1), r11=49(y1), r12=111(x2), r13=146(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 76
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 79
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 217
LDI r11, 49
LDI r12, 111
LDI r13, 146
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
