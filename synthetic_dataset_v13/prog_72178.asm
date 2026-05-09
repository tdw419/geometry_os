; DESCRIPTION: Renders a green line between points (471, 5) and (333, 55).
; PLAN: r0=471(x1), r1=5(y1), r2=333(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 5
LDI r2, 333
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
