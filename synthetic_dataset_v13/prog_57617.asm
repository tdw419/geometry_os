; DESCRIPTION: Places a red line segment connecting (409, 237) to (44, 173).
; PLAN: r0=409(x1), r1=237(y1), r2=44(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 237
LDI r2, 44
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
