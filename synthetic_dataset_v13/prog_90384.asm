; DESCRIPTION: Composite: Draws a white circle centered at (453, 146) with radius 39 then Places a black dot at position (225, 67) then Renders a orange line between points (299, 35) and (491, 162).
; PLAN: r0=453(x), r1=146(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=67(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=299(x1), r11=35(y1), r12=491(x2), r13=162(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 453
LDI r1, 146
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 67
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 299
LDI r11, 35
LDI r12, 491
LDI r13, 162
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
