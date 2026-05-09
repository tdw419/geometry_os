; DESCRIPTION: Places a white line segment connecting (493, 47) to (332, 143).
; PLAN: r0=493(x1), r1=47(y1), r2=332(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 47
LDI r2, 332
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
