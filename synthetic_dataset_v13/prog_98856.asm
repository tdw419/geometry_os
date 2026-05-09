; DESCRIPTION: Places a green line segment connecting (160, 141) to (420, 107).
; PLAN: r0=160(x1), r1=141(y1), r2=420(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 141
LDI r2, 420
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
