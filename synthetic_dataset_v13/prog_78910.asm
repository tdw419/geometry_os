; DESCRIPTION: Draws a white line from (190, 41) to (363, 236).
; PLAN: r0=190(x1), r1=41(y1), r2=363(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 41
LDI r2, 363
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
