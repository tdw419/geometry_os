; DESCRIPTION: Draws a white line from (111, 143) to (443, 188).
; PLAN: r0=111(x1), r1=143(y1), r2=443(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 143
LDI r2, 443
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
