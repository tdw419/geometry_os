; DESCRIPTION: Draws a cyan line from (68, 145) to (12, 180).
; PLAN: r0=68(x1), r1=145(y1), r2=12(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 145
LDI r2, 12
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
