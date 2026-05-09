; DESCRIPTION: Draws a red line from (501, 236) to (275, 11).
; PLAN: r0=501(x1), r1=236(y1), r2=275(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 236
LDI r2, 275
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
