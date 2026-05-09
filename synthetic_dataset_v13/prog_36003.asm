; DESCRIPTION: Composite: Places a blue circle of radius 39 at center (227, 121) then Places a magenta dot at position (150, 193) then Places a cyan line segment connecting (101, 140) to (429, 152).
; PLAN: r0=227(x), r1=121(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=193(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=101(x1), r11=140(y1), r12=429(x2), r13=152(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 121
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 193
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 101
LDI r11, 140
LDI r12, 429
LDI r13, 152
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
