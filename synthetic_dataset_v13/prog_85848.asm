; DESCRIPTION: Places a white line segment connecting (40, 230) to (48, 240).
; PLAN: r0=40(x1), r1=230(y1), r2=48(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 230
LDI r2, 48
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
