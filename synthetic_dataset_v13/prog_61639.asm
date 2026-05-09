; DESCRIPTION: Draws a yellow line from (496, 173) to (285, 65).
; PLAN: r0=496(x1), r1=173(y1), r2=285(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 173
LDI r2, 285
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
