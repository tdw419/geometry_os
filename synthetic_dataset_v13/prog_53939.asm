; DESCRIPTION: Renders a green line between points (149, 179) and (208, 215).
; PLAN: r0=149(x1), r1=179(y1), r2=208(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 179
LDI r2, 208
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
