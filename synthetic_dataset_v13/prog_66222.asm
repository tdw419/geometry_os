; DESCRIPTION: Places a white line segment connecting (368, 118) to (243, 6).
; PLAN: r0=368(x1), r1=118(y1), r2=243(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 118
LDI r2, 243
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
