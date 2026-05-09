; DESCRIPTION: Places a blue line segment connecting (241, 171) to (297, 113).
; PLAN: r0=241(x1), r1=171(y1), r2=297(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 171
LDI r2, 297
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
