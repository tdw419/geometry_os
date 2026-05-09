; DESCRIPTION: Draws a magenta line from (86, 87) to (19, 173).
; PLAN: r0=86(x1), r1=87(y1), r2=19(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 87
LDI r2, 19
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
