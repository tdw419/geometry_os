; DESCRIPTION: Places a yellow line segment connecting (469, 64) to (420, 107).
; PLAN: r0=469(x1), r1=64(y1), r2=420(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 64
LDI r2, 420
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
