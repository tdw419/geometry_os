; DESCRIPTION: Renders a white line between points (362, 101) and (162, 239).
; PLAN: r0=362(x1), r1=101(y1), r2=162(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 101
LDI r2, 162
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
