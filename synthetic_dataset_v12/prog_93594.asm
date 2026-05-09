; DESCRIPTION: Places a red line segment connecting (177, 104) to (445, 92).
; PLAN: r0=177(x1), r1=104(y1), r2=445(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 104
LDI r2, 445
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
