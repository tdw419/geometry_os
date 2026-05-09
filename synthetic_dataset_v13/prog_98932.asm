; DESCRIPTION: Places a white line segment connecting (380, 72) to (511, 193).
; PLAN: r0=380(x1), r1=72(y1), r2=511(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 72
LDI r2, 511
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
