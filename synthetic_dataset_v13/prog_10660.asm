; DESCRIPTION: Renders a yellow line between points (469, 241) and (405, 8).
; PLAN: r0=469(x1), r1=241(y1), r2=405(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 241
LDI r2, 405
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
