; DESCRIPTION: Renders a blue line between points (321, 61) and (281, 187).
; PLAN: r0=321(x1), r1=61(y1), r2=281(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 61
LDI r2, 281
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
