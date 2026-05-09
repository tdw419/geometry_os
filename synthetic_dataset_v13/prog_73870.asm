; DESCRIPTION: Places a red line segment connecting (511, 135) to (473, 195).
; PLAN: r0=511(x1), r1=135(y1), r2=473(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 135
LDI r2, 473
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
