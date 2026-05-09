; DESCRIPTION: Composite: Renders a white box of size 53x17 starting at (441, 187) then Places a orange dot at position (367, 166) then Places a white line segment connecting (234, 214) to (395, 6).
; PLAN: r0=441(x), r1=187(y), r2=53(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=166(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=234(x1), r11=214(y1), r12=395(x2), r13=6(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 187
LDI r2, 53
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 166
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 234
LDI r11, 214
LDI r12, 395
LDI r13, 6
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
