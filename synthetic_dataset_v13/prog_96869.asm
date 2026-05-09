; DESCRIPTION: Places a cyan line segment connecting (348, 72) to (252, 210).
; PLAN: r0=348(x1), r1=72(y1), r2=252(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 72
LDI r2, 252
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
