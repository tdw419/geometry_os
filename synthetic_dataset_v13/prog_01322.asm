; DESCRIPTION: Renders a green line between points (35, 231) and (231, 150).
; PLAN: r0=35(x1), r1=231(y1), r2=231(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 231
LDI r2, 231
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
