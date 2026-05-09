; DESCRIPTION: Draws a cyan line from (162, 202) to (45, 51).
; PLAN: r0=162(x1), r1=202(y1), r2=45(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 202
LDI r2, 45
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
