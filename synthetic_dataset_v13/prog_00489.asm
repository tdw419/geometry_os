; DESCRIPTION: Draws a green line from (206, 51) to (382, 9).
; PLAN: r0=206(x1), r1=51(y1), r2=382(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 51
LDI r2, 382
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
