; DESCRIPTION: Places a white line segment connecting (469, 141) to (128, 146).
; PLAN: r0=469(x1), r1=141(y1), r2=128(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 141
LDI r2, 128
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
