; DESCRIPTION: Composite: Renders a magenta line between points (219, 234) and (461, 86) then Renders a red disk with center (429, 188) and radius 50 then Places a red dot at position (219, 138).
; PLAN: r0=219(x1), r1=234(y1), r2=461(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=188(y), r7=50(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=219(x), r11=138(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 234
LDI r2, 461
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 188
LDI r7, 50
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 219
LDI r11, 138
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
