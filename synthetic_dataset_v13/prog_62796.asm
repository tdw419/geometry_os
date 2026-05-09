; DESCRIPTION: Places a white line segment connecting (231, 204) to (405, 128).
; PLAN: r0=231(x1), r1=204(y1), r2=405(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 204
LDI r2, 405
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
