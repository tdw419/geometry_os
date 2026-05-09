; DESCRIPTION: Places a white line segment connecting (90, 20) to (242, 94).
; PLAN: r0=90(x1), r1=20(y1), r2=242(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 20
LDI r2, 242
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
