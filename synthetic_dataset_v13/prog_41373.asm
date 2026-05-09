; DESCRIPTION: Draws a cyan line from (463, 183) to (31, 77).
; PLAN: r0=463(x1), r1=183(y1), r2=31(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 183
LDI r2, 31
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
