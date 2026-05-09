; DESCRIPTION: Places a red line segment connecting (216, 253) to (182, 107).
; PLAN: r0=216(x1), r1=253(y1), r2=182(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 253
LDI r2, 182
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
