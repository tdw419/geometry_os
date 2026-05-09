; DESCRIPTION: Places a red line segment connecting (127, 154) to (399, 53).
; PLAN: r0=127(x1), r1=154(y1), r2=399(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 154
LDI r2, 399
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
