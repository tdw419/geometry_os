; DESCRIPTION: Draws a green line from (51, 207) to (128, 0).
; PLAN: r0=51(x1), r1=207(y1), r2=128(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 207
LDI r2, 128
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
