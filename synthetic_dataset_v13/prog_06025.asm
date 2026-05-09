; DESCRIPTION: Renders a cyan line between points (252, 250) and (277, 158).
; PLAN: r0=252(x1), r1=250(y1), r2=277(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 250
LDI r2, 277
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
