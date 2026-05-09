; DESCRIPTION: Renders a green line between points (286, 231) and (464, 162).
; PLAN: r0=286(x1), r1=231(y1), r2=464(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 231
LDI r2, 464
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
