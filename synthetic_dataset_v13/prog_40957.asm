; DESCRIPTION: Draws a white line from (294, 86) to (443, 35).
; PLAN: r0=294(x1), r1=86(y1), r2=443(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 86
LDI r2, 443
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
