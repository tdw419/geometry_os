; DESCRIPTION: Places a yellow line segment connecting (48, 117) to (184, 45).
; PLAN: r0=48(x1), r1=117(y1), r2=184(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 117
LDI r2, 184
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
