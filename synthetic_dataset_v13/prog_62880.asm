; DESCRIPTION: Places a black line segment connecting (473, 150) to (113, 182).
; PLAN: r0=473(x1), r1=150(y1), r2=113(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 150
LDI r2, 113
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
