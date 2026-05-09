; DESCRIPTION: Places a white line segment connecting (73, 210) to (245, 113).
; PLAN: r0=73(x1), r1=210(y1), r2=245(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 210
LDI r2, 245
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
