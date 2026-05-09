; DESCRIPTION: Renders a green line between points (61, 35) and (19, 36).
; PLAN: r0=61(x1), r1=35(y1), r2=19(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 35
LDI r2, 19
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
