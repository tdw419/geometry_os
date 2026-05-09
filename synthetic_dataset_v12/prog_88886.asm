; DESCRIPTION: Draws a green line from (120, 68) to (317, 194).
; PLAN: r0=120(x1), r1=68(y1), r2=317(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 68
LDI r2, 317
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
