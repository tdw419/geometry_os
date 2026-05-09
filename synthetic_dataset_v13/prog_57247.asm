; DESCRIPTION: Places a white line segment connecting (56, 130) to (482, 182).
; PLAN: r0=56(x1), r1=130(y1), r2=482(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 130
LDI r2, 482
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
