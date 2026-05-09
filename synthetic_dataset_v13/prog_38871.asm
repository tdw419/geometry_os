; DESCRIPTION: Draws a black line from (439, 51) to (488, 162).
; PLAN: r0=439(x1), r1=51(y1), r2=488(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 51
LDI r2, 488
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
