; DESCRIPTION: Places a white line segment connecting (503, 103) to (274, 66).
; PLAN: r0=503(x1), r1=103(y1), r2=274(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 103
LDI r2, 274
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
