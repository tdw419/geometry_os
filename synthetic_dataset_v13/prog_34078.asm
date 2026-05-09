; DESCRIPTION: Draws a white line from (237, 166) to (51, 63).
; PLAN: r0=237(x1), r1=166(y1), r2=51(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 166
LDI r2, 51
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
