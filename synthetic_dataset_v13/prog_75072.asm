; DESCRIPTION: Renders a green line between points (187, 208) and (170, 157).
; PLAN: r0=187(x1), r1=208(y1), r2=170(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 208
LDI r2, 170
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
