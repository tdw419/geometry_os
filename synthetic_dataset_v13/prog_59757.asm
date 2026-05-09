; DESCRIPTION: Places a cyan line segment connecting (332, 112) to (53, 124).
; PLAN: r0=332(x1), r1=112(y1), r2=53(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 112
LDI r2, 53
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
