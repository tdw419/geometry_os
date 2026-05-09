; DESCRIPTION: Places a white line segment connecting (384, 66) to (63, 139).
; PLAN: r0=384(x1), r1=66(y1), r2=63(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 66
LDI r2, 63
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
