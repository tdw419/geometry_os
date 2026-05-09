; DESCRIPTION: Places a white line segment connecting (12, 146) to (328, 163).
; PLAN: r0=12(x1), r1=146(y1), r2=328(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 146
LDI r2, 328
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
