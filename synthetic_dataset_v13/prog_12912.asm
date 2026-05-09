; DESCRIPTION: Draws a magenta line from (215, 229) to (286, 39).
; PLAN: r0=215(x1), r1=229(y1), r2=286(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 229
LDI r2, 286
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
