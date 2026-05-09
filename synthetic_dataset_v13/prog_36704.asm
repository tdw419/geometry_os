; DESCRIPTION: Places a red line segment connecting (152, 107) to (229, 204).
; PLAN: r0=152(x1), r1=107(y1), r2=229(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 107
LDI r2, 229
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
