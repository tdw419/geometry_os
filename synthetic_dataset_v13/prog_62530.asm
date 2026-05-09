; DESCRIPTION: Renders a green line between points (258, 138) and (308, 48).
; PLAN: r0=258(x1), r1=138(y1), r2=308(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 138
LDI r2, 308
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
