; DESCRIPTION: Draws a magenta line from (498, 191) to (215, 208).
; PLAN: r0=498(x1), r1=191(y1), r2=215(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 191
LDI r2, 215
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
