; DESCRIPTION: Renders a green line between points (375, 206) and (62, 161).
; PLAN: r0=375(x1), r1=206(y1), r2=62(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 206
LDI r2, 62
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
