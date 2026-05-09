; DESCRIPTION: Places a blue line segment connecting (348, 134) to (171, 27).
; PLAN: r0=348(x1), r1=134(y1), r2=171(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 134
LDI r2, 171
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
