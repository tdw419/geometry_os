; DESCRIPTION: Draws a cyan line from (194, 179) to (183, 75).
; PLAN: r0=194(x1), r1=179(y1), r2=183(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 179
LDI r2, 183
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
