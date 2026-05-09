; DESCRIPTION: Places a white line segment connecting (457, 209) to (182, 125).
; PLAN: r0=457(x1), r1=209(y1), r2=182(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 209
LDI r2, 182
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
