; DESCRIPTION: Draws a green line from (440, 164) to (448, 182).
; PLAN: r0=440(x1), r1=164(y1), r2=448(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 164
LDI r2, 448
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
