; DESCRIPTION: Renders a green line between points (466, 209) and (141, 52).
; PLAN: r0=466(x1), r1=209(y1), r2=141(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 209
LDI r2, 141
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
