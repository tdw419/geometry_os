; DESCRIPTION: Renders a yellow line between points (365, 80) and (456, 210).
; PLAN: r0=365(x1), r1=80(y1), r2=456(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 80
LDI r2, 456
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
