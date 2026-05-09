; DESCRIPTION: Places a green line segment connecting (20, 230) to (330, 142).
; PLAN: r0=20(x1), r1=230(y1), r2=330(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 230
LDI r2, 330
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
