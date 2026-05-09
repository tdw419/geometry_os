; DESCRIPTION: Draws a magenta line from (6, 94) to (103, 173).
; PLAN: r0=6(x1), r1=94(y1), r2=103(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 94
LDI r2, 103
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
