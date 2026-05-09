; DESCRIPTION: Places a white line segment connecting (334, 206) to (330, 103).
; PLAN: r0=334(x1), r1=206(y1), r2=330(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 206
LDI r2, 330
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
