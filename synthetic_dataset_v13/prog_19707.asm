; DESCRIPTION: Renders a green line between points (234, 95) and (57, 184).
; PLAN: r0=234(x1), r1=95(y1), r2=57(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 95
LDI r2, 57
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
