; DESCRIPTION: Renders a magenta line between points (308, 193) and (149, 195).
; PLAN: r0=308(x1), r1=193(y1), r2=149(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 193
LDI r2, 149
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
