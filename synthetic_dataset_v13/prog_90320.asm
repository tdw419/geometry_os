; DESCRIPTION: Renders a green line between points (256, 6) and (182, 100).
; PLAN: r0=256(x1), r1=6(y1), r2=182(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 6
LDI r2, 182
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
