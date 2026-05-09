; DESCRIPTION: Renders a blue line between points (368, 117) and (51, 215).
; PLAN: r0=368(x1), r1=117(y1), r2=51(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 117
LDI r2, 51
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
