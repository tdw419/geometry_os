; DESCRIPTION: Renders a black line between points (115, 42) and (374, 25).
; PLAN: r0=115(x1), r1=42(y1), r2=374(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 42
LDI r2, 374
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
