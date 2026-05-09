; DESCRIPTION: Places a white line segment connecting (473, 130) to (509, 17).
; PLAN: r0=473(x1), r1=130(y1), r2=509(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 130
LDI r2, 509
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
