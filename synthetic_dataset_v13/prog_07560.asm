; DESCRIPTION: Renders a red line between points (324, 114) and (469, 242).
; PLAN: r0=324(x1), r1=114(y1), r2=469(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 114
LDI r2, 469
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
