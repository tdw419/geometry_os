; DESCRIPTION: Renders a green line between points (273, 61) and (482, 26).
; PLAN: r0=273(x1), r1=61(y1), r2=482(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 61
LDI r2, 482
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
