; DESCRIPTION: Renders a yellow line between points (60, 95) and (170, 195).
; PLAN: r0=60(x1), r1=95(y1), r2=170(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 95
LDI r2, 170
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
