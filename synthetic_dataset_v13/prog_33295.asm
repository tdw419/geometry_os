; DESCRIPTION: Places a green line segment connecting (198, 253) to (491, 165).
; PLAN: r0=198(x1), r1=253(y1), r2=491(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 253
LDI r2, 491
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
