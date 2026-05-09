; DESCRIPTION: Renders a green line between points (412, 62) and (8, 95).
; PLAN: r0=412(x1), r1=62(y1), r2=8(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 62
LDI r2, 8
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
