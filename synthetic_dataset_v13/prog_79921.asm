; DESCRIPTION: Places a green line segment connecting (282, 149) to (434, 238).
; PLAN: r0=282(x1), r1=149(y1), r2=434(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 149
LDI r2, 434
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
