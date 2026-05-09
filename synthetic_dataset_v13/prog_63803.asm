; DESCRIPTION: Places a orange line segment connecting (305, 249) to (405, 142).
; PLAN: r0=305(x1), r1=249(y1), r2=405(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 249
LDI r2, 405
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
