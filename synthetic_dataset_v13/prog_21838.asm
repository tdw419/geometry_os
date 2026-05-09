; DESCRIPTION: Places a white line segment connecting (233, 112) to (467, 242).
; PLAN: r0=233(x1), r1=112(y1), r2=467(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 112
LDI r2, 467
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
