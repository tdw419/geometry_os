; DESCRIPTION: Draws a black line from (113, 82) to (140, 9).
; PLAN: r0=113(x1), r1=82(y1), r2=140(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 82
LDI r2, 140
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
