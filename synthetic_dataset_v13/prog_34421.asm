; DESCRIPTION: Draws a white line from (171, 197) to (443, 78).
; PLAN: r0=171(x1), r1=197(y1), r2=443(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 197
LDI r2, 443
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
