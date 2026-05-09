; DESCRIPTION: Renders a green line between points (20, 187) and (308, 62).
; PLAN: r0=20(x1), r1=187(y1), r2=308(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 187
LDI r2, 308
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
