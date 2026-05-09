; DESCRIPTION: Places a white line segment connecting (88, 103) to (167, 236).
; PLAN: r0=88(x1), r1=103(y1), r2=167(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 103
LDI r2, 167
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
