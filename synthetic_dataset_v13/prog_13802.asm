; DESCRIPTION: Renders a green line between points (90, 20) and (16, 212).
; PLAN: r0=90(x1), r1=20(y1), r2=16(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 20
LDI r2, 16
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
