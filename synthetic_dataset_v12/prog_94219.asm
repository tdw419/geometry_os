; DESCRIPTION: Renders a white line between points (309, 61) and (437, 206).
; PLAN: r0=309(x1), r1=61(y1), r2=437(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 61
LDI r2, 437
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
