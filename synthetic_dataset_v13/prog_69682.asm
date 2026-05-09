; DESCRIPTION: Renders a yellow line between points (443, 144) and (64, 177).
; PLAN: r0=443(x1), r1=144(y1), r2=64(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 144
LDI r2, 64
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
