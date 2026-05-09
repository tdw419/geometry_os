; DESCRIPTION: Places a white line segment connecting (248, 128) to (8, 202).
; PLAN: r0=248(x1), r1=128(y1), r2=8(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 128
LDI r2, 8
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
