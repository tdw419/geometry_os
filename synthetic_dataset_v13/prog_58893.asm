; DESCRIPTION: Draws a magenta line from (51, 24) to (248, 239).
; PLAN: r0=51(x1), r1=24(y1), r2=248(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 24
LDI r2, 248
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
