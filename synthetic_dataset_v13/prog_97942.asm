; DESCRIPTION: Draws a black line from (136, 234) to (23, 173).
; PLAN: r0=136(x1), r1=234(y1), r2=23(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 234
LDI r2, 23
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
