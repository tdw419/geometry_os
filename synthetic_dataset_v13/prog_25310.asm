; DESCRIPTION: Draws a green line from (466, 100) to (146, 4).
; PLAN: r0=466(x1), r1=100(y1), r2=146(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 100
LDI r2, 146
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
