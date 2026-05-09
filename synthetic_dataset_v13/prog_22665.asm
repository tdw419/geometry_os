; DESCRIPTION: Places a cyan line segment connecting (134, 27) to (413, 43).
; PLAN: r0=134(x1), r1=27(y1), r2=413(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 27
LDI r2, 413
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
