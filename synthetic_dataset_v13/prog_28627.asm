; DESCRIPTION: Renders a green line between points (98, 134) and (356, 57).
; PLAN: r0=98(x1), r1=134(y1), r2=356(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 134
LDI r2, 356
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
