; DESCRIPTION: Places a white line segment connecting (328, 29) to (279, 4).
; PLAN: r0=328(x1), r1=29(y1), r2=279(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 29
LDI r2, 279
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
