; DESCRIPTION: Renders a green line between points (265, 40) and (442, 178).
; PLAN: r0=265(x1), r1=40(y1), r2=442(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 40
LDI r2, 442
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
