; DESCRIPTION: Renders a green line between points (95, 202) and (212, 24).
; PLAN: r0=95(x1), r1=202(y1), r2=212(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 202
LDI r2, 212
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
