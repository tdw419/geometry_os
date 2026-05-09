; DESCRIPTION: Places a white line segment connecting (48, 241) to (384, 58).
; PLAN: r0=48(x1), r1=241(y1), r2=384(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 241
LDI r2, 384
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
