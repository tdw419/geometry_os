; DESCRIPTION: Places a red line segment connecting (47, 117) to (322, 187).
; PLAN: r0=47(x1), r1=117(y1), r2=322(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 117
LDI r2, 322
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
