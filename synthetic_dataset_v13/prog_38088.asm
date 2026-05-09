; DESCRIPTION: Renders a green line between points (223, 36) and (326, 207).
; PLAN: r0=223(x1), r1=36(y1), r2=326(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 36
LDI r2, 326
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
