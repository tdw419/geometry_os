; DESCRIPTION: Renders a green line between points (347, 255) and (493, 134).
; PLAN: r0=347(x1), r1=255(y1), r2=493(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 255
LDI r2, 493
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
