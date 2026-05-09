; DESCRIPTION: Renders a white line between points (166, 107) and (23, 183).
; PLAN: r0=166(x1), r1=107(y1), r2=23(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 107
LDI r2, 23
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
