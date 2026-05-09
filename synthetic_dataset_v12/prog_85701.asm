; DESCRIPTION: Renders a yellow line between points (482, 157) and (326, 168).
; PLAN: r0=482(x1), r1=157(y1), r2=326(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 157
LDI r2, 326
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
