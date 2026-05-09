; DESCRIPTION: Renders a white line between points (331, 224) and (368, 114).
; PLAN: r0=331(x1), r1=224(y1), r2=368(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 224
LDI r2, 368
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
