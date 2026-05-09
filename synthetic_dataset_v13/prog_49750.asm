; DESCRIPTION: Places a white line segment connecting (403, 7) to (95, 187).
; PLAN: r0=403(x1), r1=7(y1), r2=95(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 7
LDI r2, 95
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
