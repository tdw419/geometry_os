; DESCRIPTION: Places a white line segment connecting (406, 211) to (405, 239).
; PLAN: r0=406(x1), r1=211(y1), r2=405(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 211
LDI r2, 405
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
