; DESCRIPTION: Renders a green line between points (236, 216) and (121, 115).
; PLAN: r0=236(x1), r1=216(y1), r2=121(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 216
LDI r2, 121
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
