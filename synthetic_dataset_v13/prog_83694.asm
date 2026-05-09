; DESCRIPTION: Places a white line segment connecting (425, 88) to (245, 27).
; PLAN: r0=425(x1), r1=88(y1), r2=245(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 88
LDI r2, 245
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
