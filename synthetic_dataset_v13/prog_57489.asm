; DESCRIPTION: Renders a green line between points (420, 231) and (54, 82).
; PLAN: r0=420(x1), r1=231(y1), r2=54(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 231
LDI r2, 54
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
