; DESCRIPTION: Draws a magenta line from (457, 164) to (303, 120).
; PLAN: r0=457(x1), r1=164(y1), r2=303(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 164
LDI r2, 303
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
