; DESCRIPTION: Places a white line segment connecting (101, 239) to (20, 125).
; PLAN: r0=101(x1), r1=239(y1), r2=20(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 239
LDI r2, 20
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
