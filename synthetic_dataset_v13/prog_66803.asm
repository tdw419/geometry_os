; DESCRIPTION: Places a white line segment connecting (25, 239) to (437, 163).
; PLAN: r0=25(x1), r1=239(y1), r2=437(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 239
LDI r2, 437
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
