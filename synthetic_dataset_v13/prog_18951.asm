; DESCRIPTION: Places a white line segment connecting (503, 253) to (209, 109).
; PLAN: r0=503(x1), r1=253(y1), r2=209(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 253
LDI r2, 209
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
