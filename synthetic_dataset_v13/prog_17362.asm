; DESCRIPTION: Draws a cyan line from (50, 227) to (483, 88).
; PLAN: r0=50(x1), r1=227(y1), r2=483(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 227
LDI r2, 483
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
