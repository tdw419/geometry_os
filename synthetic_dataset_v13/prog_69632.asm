; DESCRIPTION: Places a white line segment connecting (509, 227) to (394, 59).
; PLAN: r0=509(x1), r1=227(y1), r2=394(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 227
LDI r2, 394
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
