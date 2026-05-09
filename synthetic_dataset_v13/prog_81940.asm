; DESCRIPTION: Draws a cyan line from (259, 51) to (273, 115).
; PLAN: r0=259(x1), r1=51(y1), r2=273(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 51
LDI r2, 273
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
