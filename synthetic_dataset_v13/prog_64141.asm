; DESCRIPTION: Draws a blue line from (361, 89) to (346, 209).
; PLAN: r0=361(x1), r1=89(y1), r2=346(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 89
LDI r2, 346
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
