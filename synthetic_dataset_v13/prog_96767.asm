; DESCRIPTION: Renders a green line between points (68, 119) and (48, 166).
; PLAN: r0=68(x1), r1=119(y1), r2=48(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 119
LDI r2, 48
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
