; DESCRIPTION: Places a white line segment connecting (242, 81) to (5, 82).
; PLAN: r0=242(x1), r1=81(y1), r2=5(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 81
LDI r2, 5
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
