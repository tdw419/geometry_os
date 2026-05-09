; DESCRIPTION: Places a yellow line segment connecting (297, 143) to (412, 107).
; PLAN: r0=297(x1), r1=143(y1), r2=412(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 143
LDI r2, 412
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
