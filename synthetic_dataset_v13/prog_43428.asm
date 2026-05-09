; DESCRIPTION: Places a green line segment connecting (413, 195) to (120, 171).
; PLAN: r0=413(x1), r1=195(y1), r2=120(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 195
LDI r2, 120
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
