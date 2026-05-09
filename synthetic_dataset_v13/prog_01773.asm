; DESCRIPTION: Places a white line segment connecting (247, 157) to (446, 60).
; PLAN: r0=247(x1), r1=157(y1), r2=446(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 157
LDI r2, 446
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
