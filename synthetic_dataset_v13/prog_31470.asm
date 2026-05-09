; DESCRIPTION: Draws a green line from (495, 86) to (149, 29).
; PLAN: r0=495(x1), r1=86(y1), r2=149(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 86
LDI r2, 149
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
