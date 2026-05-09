; DESCRIPTION: Places a white line segment connecting (228, 224) to (212, 39).
; PLAN: r0=228(x1), r1=224(y1), r2=212(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 224
LDI r2, 212
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
