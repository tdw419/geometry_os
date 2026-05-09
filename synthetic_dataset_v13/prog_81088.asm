; DESCRIPTION: Places a red line segment connecting (399, 241) to (410, 173).
; PLAN: r0=399(x1), r1=241(y1), r2=410(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 241
LDI r2, 410
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
