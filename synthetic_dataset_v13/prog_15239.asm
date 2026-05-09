; DESCRIPTION: Draws a magenta line from (70, 131) to (177, 193).
; PLAN: r0=70(x1), r1=131(y1), r2=177(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 131
LDI r2, 177
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
