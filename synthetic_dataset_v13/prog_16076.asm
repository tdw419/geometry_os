; DESCRIPTION: Renders a purple line between points (187, 2) and (433, 16).
; PLAN: r0=187(x1), r1=2(y1), r2=433(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 2
LDI r2, 433
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
