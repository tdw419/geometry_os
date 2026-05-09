; DESCRIPTION: Draws a black line from (315, 174) to (365, 50).
; PLAN: r0=315(x1), r1=174(y1), r2=365(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 174
LDI r2, 365
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
