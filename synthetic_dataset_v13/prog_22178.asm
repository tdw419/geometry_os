; DESCRIPTION: Places a white line segment connecting (101, 239) to (140, 65).
; PLAN: r0=101(x1), r1=239(y1), r2=140(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 239
LDI r2, 140
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
