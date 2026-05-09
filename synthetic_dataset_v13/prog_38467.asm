; DESCRIPTION: Draws a yellow line from (449, 173) to (172, 122).
; PLAN: r0=449(x1), r1=173(y1), r2=172(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 173
LDI r2, 172
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
