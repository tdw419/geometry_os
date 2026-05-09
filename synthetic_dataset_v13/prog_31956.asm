; DESCRIPTION: Renders a green line between points (463, 210) and (259, 115).
; PLAN: r0=463(x1), r1=210(y1), r2=259(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 210
LDI r2, 259
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
