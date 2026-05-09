; DESCRIPTION: Renders a green line between points (49, 231) and (456, 220).
; PLAN: r0=49(x1), r1=231(y1), r2=456(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 231
LDI r2, 456
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
