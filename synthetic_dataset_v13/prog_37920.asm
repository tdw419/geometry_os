; DESCRIPTION: Renders a yellow line between points (469, 182) and (469, 150).
; PLAN: r0=469(x1), r1=182(y1), r2=469(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 182
LDI r2, 469
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
