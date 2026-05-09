; DESCRIPTION: Draws a magenta line from (53, 191) to (347, 146).
; PLAN: r0=53(x1), r1=191(y1), r2=347(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 191
LDI r2, 347
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
