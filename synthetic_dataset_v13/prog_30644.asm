; DESCRIPTION: Draws a magenta line from (136, 173) to (131, 102).
; PLAN: r0=136(x1), r1=173(y1), r2=131(x2), r3=102(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 173
LDI r2, 131
LDI r3, 102
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
