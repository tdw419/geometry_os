; DESCRIPTION: Draws a black line from (82, 182) to (313, 119).
; PLAN: r0=82(x1), r1=182(y1), r2=313(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 182
LDI r2, 313
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
