; DESCRIPTION: Draws a yellow line from (317, 70) to (82, 177).
; PLAN: r0=317(x1), r1=70(y1), r2=82(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 70
LDI r2, 82
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
