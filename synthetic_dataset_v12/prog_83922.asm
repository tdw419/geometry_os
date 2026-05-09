; DESCRIPTION: Draws a white line from (477, 106) to (164, 195).
; PLAN: r0=477(x1), r1=106(y1), r2=164(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 106
LDI r2, 164
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
