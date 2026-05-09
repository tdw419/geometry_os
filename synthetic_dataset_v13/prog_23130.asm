; DESCRIPTION: Renders a green line between points (15, 146) and (329, 70).
; PLAN: r0=15(x1), r1=146(y1), r2=329(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 146
LDI r2, 329
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
