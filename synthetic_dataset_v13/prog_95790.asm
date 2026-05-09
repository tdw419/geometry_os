; DESCRIPTION: Places a white line segment connecting (215, 69) to (292, 92).
; PLAN: r0=215(x1), r1=69(y1), r2=292(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 69
LDI r2, 292
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
