; DESCRIPTION: Places a white line segment connecting (384, 33) to (52, 21).
; PLAN: r0=384(x1), r1=33(y1), r2=52(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 33
LDI r2, 52
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
