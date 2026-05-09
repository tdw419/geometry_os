; DESCRIPTION: Places a white line segment connecting (111, 128) to (125, 153).
; PLAN: r0=111(x1), r1=128(y1), r2=125(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 128
LDI r2, 125
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
