; DESCRIPTION: Renders a green line between points (291, 202) and (98, 55).
; PLAN: r0=291(x1), r1=202(y1), r2=98(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 202
LDI r2, 98
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
