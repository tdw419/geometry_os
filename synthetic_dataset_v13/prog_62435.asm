; DESCRIPTION: Draws a green line from (4, 217) to (286, 95).
; PLAN: r0=4(x1), r1=217(y1), r2=286(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 217
LDI r2, 286
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
