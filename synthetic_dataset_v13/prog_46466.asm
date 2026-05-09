; DESCRIPTION: Places a white line segment connecting (299, 90) to (82, 67).
; PLAN: r0=299(x1), r1=90(y1), r2=82(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 90
LDI r2, 82
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
