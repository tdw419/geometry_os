; DESCRIPTION: Renders a black line between points (330, 40) and (60, 187).
; PLAN: r0=330(x1), r1=40(y1), r2=60(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 40
LDI r2, 60
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
