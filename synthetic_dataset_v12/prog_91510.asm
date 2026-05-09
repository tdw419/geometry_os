; DESCRIPTION: Places a green line segment connecting (382, 60) to (413, 171).
; PLAN: r0=382(x1), r1=60(y1), r2=413(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 60
LDI r2, 413
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
