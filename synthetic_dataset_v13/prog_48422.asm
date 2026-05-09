; DESCRIPTION: Places a white line segment connecting (425, 128) to (412, 200).
; PLAN: r0=425(x1), r1=128(y1), r2=412(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 128
LDI r2, 412
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
