; DESCRIPTION: Renders a green line between points (13, 176) and (28, 182).
; PLAN: r0=13(x1), r1=176(y1), r2=28(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 176
LDI r2, 28
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
