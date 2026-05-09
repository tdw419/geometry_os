; DESCRIPTION: Places a yellow line segment connecting (503, 182) to (423, 67).
; PLAN: r0=503(x1), r1=182(y1), r2=423(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 182
LDI r2, 423
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
