; DESCRIPTION: Places a magenta line segment connecting (361, 236) to (19, 95).
; PLAN: r0=361(x1), r1=236(y1), r2=19(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 236
LDI r2, 19
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
