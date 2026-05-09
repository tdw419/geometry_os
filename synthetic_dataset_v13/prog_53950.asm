; DESCRIPTION: Renders a green line between points (108, 22) and (434, 206).
; PLAN: r0=108(x1), r1=22(y1), r2=434(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 22
LDI r2, 434
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
