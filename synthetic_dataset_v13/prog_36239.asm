; DESCRIPTION: Renders a green line between points (223, 178) and (157, 229).
; PLAN: r0=223(x1), r1=178(y1), r2=157(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 178
LDI r2, 157
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
