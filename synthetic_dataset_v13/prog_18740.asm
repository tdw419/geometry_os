; DESCRIPTION: Draws a cyan line from (75, 118) to (96, 116).
; PLAN: r0=75(x1), r1=118(y1), r2=96(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 118
LDI r2, 96
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
