; DESCRIPTION: Places a red line segment connecting (434, 222) to (457, 107).
; PLAN: r0=434(x1), r1=222(y1), r2=457(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 222
LDI r2, 457
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
