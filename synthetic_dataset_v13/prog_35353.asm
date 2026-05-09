; DESCRIPTION: Renders a blue line between points (370, 16) and (193, 103).
; PLAN: r0=370(x1), r1=16(y1), r2=193(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 16
LDI r2, 193
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
