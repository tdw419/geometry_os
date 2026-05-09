; DESCRIPTION: Places a yellow line segment connecting (504, 182) to (354, 31).
; PLAN: r0=504(x1), r1=182(y1), r2=354(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 182
LDI r2, 354
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
