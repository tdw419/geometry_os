; DESCRIPTION: Draws a red line from (151, 164) to (498, 14).
; PLAN: r0=151(x1), r1=164(y1), r2=498(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 164
LDI r2, 498
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
