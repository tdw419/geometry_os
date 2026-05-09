; DESCRIPTION: Draws a magenta line from (317, 164) to (368, 63).
; PLAN: r0=317(x1), r1=164(y1), r2=368(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 164
LDI r2, 368
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
