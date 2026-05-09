; DESCRIPTION: Places a red line segment connecting (329, 159) to (259, 173).
; PLAN: r0=329(x1), r1=159(y1), r2=259(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 159
LDI r2, 259
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
