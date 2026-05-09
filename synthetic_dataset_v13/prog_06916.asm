; DESCRIPTION: Draws a cyan line from (343, 48) to (25, 205).
; PLAN: r0=343(x1), r1=48(y1), r2=25(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 48
LDI r2, 25
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
