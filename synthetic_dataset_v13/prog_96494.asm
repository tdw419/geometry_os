; DESCRIPTION: Draws a cyan line from (146, 76) to (106, 140).
; PLAN: r0=146(x1), r1=76(y1), r2=106(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 76
LDI r2, 106
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
