; DESCRIPTION: Draws a cyan line from (69, 118) to (463, 109).
; PLAN: r0=69(x1), r1=118(y1), r2=463(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 118
LDI r2, 463
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
