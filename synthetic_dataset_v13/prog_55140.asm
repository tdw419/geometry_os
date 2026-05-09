; DESCRIPTION: Renders a magenta line between points (259, 157) and (333, 233).
; PLAN: r0=259(x1), r1=157(y1), r2=333(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 157
LDI r2, 333
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
