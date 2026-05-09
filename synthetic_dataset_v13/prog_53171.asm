; DESCRIPTION: Draws a green line from (82, 51) to (184, 25).
; PLAN: r0=82(x1), r1=51(y1), r2=184(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 51
LDI r2, 184
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
