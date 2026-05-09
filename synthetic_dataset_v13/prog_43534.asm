; DESCRIPTION: Draws a cyan line from (20, 105) to (43, 251).
; PLAN: r0=20(x1), r1=105(y1), r2=43(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 105
LDI r2, 43
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
