; DESCRIPTION: Draws a magenta line from (421, 173) to (119, 90).
; PLAN: r0=421(x1), r1=173(y1), r2=119(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 173
LDI r2, 119
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
