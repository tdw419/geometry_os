; DESCRIPTION: Places a white line segment connecting (233, 112) to (209, 48).
; PLAN: r0=233(x1), r1=112(y1), r2=209(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 112
LDI r2, 209
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
