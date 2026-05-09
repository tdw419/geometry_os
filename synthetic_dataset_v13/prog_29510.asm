; DESCRIPTION: Renders a green line between points (304, 107) and (78, 37).
; PLAN: r0=304(x1), r1=107(y1), r2=78(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 107
LDI r2, 78
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
