; DESCRIPTION: Renders a green line between points (470, 58) and (456, 96).
; PLAN: r0=470(x1), r1=58(y1), r2=456(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 58
LDI r2, 456
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
