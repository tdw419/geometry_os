; DESCRIPTION: Draws a red line from (19, 189) to (150, 44).
; PLAN: r0=19(x1), r1=189(y1), r2=150(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 189
LDI r2, 150
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
