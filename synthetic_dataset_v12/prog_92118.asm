; DESCRIPTION: Places a red line segment connecting (209, 130) to (113, 77).
; PLAN: r0=209(x1), r1=130(y1), r2=113(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 130
LDI r2, 113
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
