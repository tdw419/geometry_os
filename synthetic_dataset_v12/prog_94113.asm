; DESCRIPTION: Places a white line segment connecting (502, 77) to (101, 71).
; PLAN: r0=502(x1), r1=77(y1), r2=101(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 77
LDI r2, 101
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
