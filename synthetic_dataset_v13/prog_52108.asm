; DESCRIPTION: Composite: Creates a magenta circular shape at (462, 85) with radius 50 then Sets a single magenta pixel at (142, 205) then Draws a magenta line from (451, 0) to (227, 42).
; PLAN: r0=462(x), r1=85(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x), r6=205(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=451(x1), r11=0(y1), r12=227(x2), r13=42(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 462
LDI r1, 85
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 205
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 451
LDI r11, 0
LDI r12, 227
LDI r13, 42
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
