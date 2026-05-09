; DESCRIPTION: Places a green line segment connecting (354, 74) to (268, 241).
; PLAN: r0=354(x1), r1=74(y1), r2=268(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 74
LDI r2, 268
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
