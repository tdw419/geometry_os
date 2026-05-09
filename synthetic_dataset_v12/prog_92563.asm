; DESCRIPTION: Draws a green line from (51, 28) to (455, 5).
; PLAN: r0=51(x1), r1=28(y1), r2=455(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 28
LDI r2, 455
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
