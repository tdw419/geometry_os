; DESCRIPTION: Places a green line segment connecting (241, 124) to (460, 103).
; PLAN: r0=241(x1), r1=124(y1), r2=460(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 124
LDI r2, 460
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
