; DESCRIPTION: Draws a cyan line from (399, 11) to (22, 161).
; PLAN: r0=399(x1), r1=11(y1), r2=22(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 11
LDI r2, 22
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
