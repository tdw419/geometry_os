; DESCRIPTION: Renders a orange line between points (475, 197) and (456, 33).
; PLAN: r0=475(x1), r1=197(y1), r2=456(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 197
LDI r2, 456
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
