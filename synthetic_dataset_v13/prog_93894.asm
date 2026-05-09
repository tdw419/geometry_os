; DESCRIPTION: Renders a black line between points (130, 247) and (370, 187).
; PLAN: r0=130(x1), r1=247(y1), r2=370(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 247
LDI r2, 370
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
