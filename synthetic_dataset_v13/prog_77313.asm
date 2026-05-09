; DESCRIPTION: Renders a green line between points (14, 193) and (374, 57).
; PLAN: r0=14(x1), r1=193(y1), r2=374(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 193
LDI r2, 374
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
