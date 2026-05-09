; DESCRIPTION: Places a yellow line segment connecting (244, 179) to (346, 107).
; PLAN: r0=244(x1), r1=179(y1), r2=346(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 179
LDI r2, 346
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
