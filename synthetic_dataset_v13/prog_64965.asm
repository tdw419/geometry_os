; DESCRIPTION: Composite: Renders a red disk with center (103, 123) and radius 56 then Places a orange dot at position (377, 242) then Places a magenta line segment connecting (299, 73) to (109, 10).
; PLAN: r0=103(x), r1=123(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=242(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=299(x1), r11=73(y1), r12=109(x2), r13=10(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 123
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 242
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 299
LDI r11, 73
LDI r12, 109
LDI r13, 10
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
