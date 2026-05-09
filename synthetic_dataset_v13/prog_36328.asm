; DESCRIPTION: Composite: Renders a orange box of size 51x66 starting at (392, 125) then Places a purple dot at position (325, 10) then Places a magenta line segment connecting (12, 138) to (64, 130).
; PLAN: r0=392(x), r1=125(y), r2=51(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x), r6=10(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=12(x1), r11=138(y1), r12=64(x2), r13=130(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 125
LDI r2, 51
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 10
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 12
LDI r11, 138
LDI r12, 64
LDI r13, 130
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
