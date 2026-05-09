; DESCRIPTION: Renders a green line between points (321, 187) and (477, 60).
; PLAN: r0=321(x1), r1=187(y1), r2=477(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 187
LDI r2, 477
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
