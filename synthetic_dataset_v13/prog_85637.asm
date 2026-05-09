; DESCRIPTION: Draws a white line from (306, 180) to (405, 133).
; PLAN: r0=306(x1), r1=180(y1), r2=405(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 180
LDI r2, 405
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
