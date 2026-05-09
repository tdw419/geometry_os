; DESCRIPTION: Renders a green line between points (48, 245) and (273, 9).
; PLAN: r0=48(x1), r1=245(y1), r2=273(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 245
LDI r2, 273
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
