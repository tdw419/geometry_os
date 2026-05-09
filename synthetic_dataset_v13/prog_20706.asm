; DESCRIPTION: Places a green line segment connecting (360, 230) to (52, 182).
; PLAN: r0=360(x1), r1=230(y1), r2=52(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 230
LDI r2, 52
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
