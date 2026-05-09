; DESCRIPTION: Renders a green line between points (90, 22) and (306, 86).
; PLAN: r0=90(x1), r1=22(y1), r2=306(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 22
LDI r2, 306
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
