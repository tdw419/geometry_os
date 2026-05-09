; DESCRIPTION: Draws a red line from (491, 10) to (508, 195).
; PLAN: r0=491(x1), r1=10(y1), r2=508(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 10
LDI r2, 508
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
