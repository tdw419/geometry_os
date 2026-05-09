; DESCRIPTION: Draws a red line from (307, 57) to (153, 66).
; PLAN: r0=307(x1), r1=57(y1), r2=153(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 57
LDI r2, 153
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
