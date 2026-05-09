; DESCRIPTION: Renders a cyan line between points (314, 187) and (15, 91).
; PLAN: r0=314(x1), r1=187(y1), r2=15(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 187
LDI r2, 15
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
