; DESCRIPTION: Places a white line segment connecting (376, 124) to (491, 182).
; PLAN: r0=376(x1), r1=124(y1), r2=491(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 124
LDI r2, 491
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
