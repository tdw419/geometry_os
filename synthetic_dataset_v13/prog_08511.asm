; DESCRIPTION: Places a white line segment connecting (406, 157) to (157, 202).
; PLAN: r0=406(x1), r1=157(y1), r2=157(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 157
LDI r2, 157
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
