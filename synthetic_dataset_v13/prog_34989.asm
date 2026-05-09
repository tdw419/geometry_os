; DESCRIPTION: Renders a blue line between points (333, 69) and (425, 231).
; PLAN: r0=333(x1), r1=69(y1), r2=425(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 69
LDI r2, 425
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
