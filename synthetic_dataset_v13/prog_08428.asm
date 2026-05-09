; DESCRIPTION: Places a white line segment connecting (403, 178) to (420, 237).
; PLAN: r0=403(x1), r1=178(y1), r2=420(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 178
LDI r2, 420
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
