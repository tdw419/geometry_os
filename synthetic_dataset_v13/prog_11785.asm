; DESCRIPTION: Places a blue line segment connecting (184, 206) to (449, 186).
; PLAN: r0=184(x1), r1=206(y1), r2=449(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 206
LDI r2, 449
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
