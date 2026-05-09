; DESCRIPTION: Draws a magenta line from (492, 28) to (122, 51).
; PLAN: r0=492(x1), r1=28(y1), r2=122(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 28
LDI r2, 122
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
