; DESCRIPTION: Places a yellow line segment connecting (213, 190) to (322, 65).
; PLAN: r0=213(x1), r1=190(y1), r2=322(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 190
LDI r2, 322
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
