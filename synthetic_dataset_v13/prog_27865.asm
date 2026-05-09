; DESCRIPTION: Places a red line segment connecting (92, 117) to (126, 187).
; PLAN: r0=92(x1), r1=117(y1), r2=126(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 117
LDI r2, 126
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
