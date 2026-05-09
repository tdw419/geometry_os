; DESCRIPTION: Places a yellow line segment connecting (426, 29) to (285, 125).
; PLAN: r0=426(x1), r1=29(y1), r2=285(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 29
LDI r2, 285
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
