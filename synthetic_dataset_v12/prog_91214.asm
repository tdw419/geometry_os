; DESCRIPTION: Renders a green line between points (170, 162) and (74, 37).
; PLAN: r0=170(x1), r1=162(y1), r2=74(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 162
LDI r2, 74
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
