; DESCRIPTION: Renders a green line between points (370, 78) and (265, 107).
; PLAN: r0=370(x1), r1=78(y1), r2=265(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 78
LDI r2, 265
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
