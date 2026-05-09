; DESCRIPTION: Places a white line segment connecting (202, 49) to (39, 73).
; PLAN: r0=202(x1), r1=49(y1), r2=39(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 49
LDI r2, 39
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
