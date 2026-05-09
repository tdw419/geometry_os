; DESCRIPTION: Places a green line segment connecting (478, 239) to (434, 74).
; PLAN: r0=478(x1), r1=239(y1), r2=434(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 239
LDI r2, 434
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
