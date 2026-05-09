; DESCRIPTION: Places a white line segment connecting (346, 45) to (383, 92).
; PLAN: r0=346(x1), r1=45(y1), r2=383(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 45
LDI r2, 383
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
