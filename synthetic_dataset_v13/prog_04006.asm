; DESCRIPTION: Renders a red line between points (322, 12) and (405, 44).
; PLAN: r0=322(x1), r1=12(y1), r2=405(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 12
LDI r2, 405
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
