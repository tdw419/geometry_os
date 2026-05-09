; DESCRIPTION: Composite: Creates a magenta circular shape at (356, 86) with radius 23 then Places a orange dot at position (115, 142) then Places a purple line segment connecting (167, 247) to (397, 19).
; PLAN: r0=356(x), r1=86(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=142(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=167(x1), r11=247(y1), r12=397(x2), r13=19(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 86
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 142
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 167
LDI r11, 247
LDI r12, 397
LDI r13, 19
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
