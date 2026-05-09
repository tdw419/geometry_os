; DESCRIPTION: Renders a green line between points (120, 37) and (406, 206).
; PLAN: r0=120(x1), r1=37(y1), r2=406(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 37
LDI r2, 406
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
