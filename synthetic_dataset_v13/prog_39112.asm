; DESCRIPTION: Renders a red line between points (126, 242) and (119, 23).
; PLAN: r0=126(x1), r1=242(y1), r2=119(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 242
LDI r2, 119
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
