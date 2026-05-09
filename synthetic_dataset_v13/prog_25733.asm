; DESCRIPTION: Places a cyan line segment connecting (378, 67) to (338, 223).
; PLAN: r0=378(x1), r1=67(y1), r2=338(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 67
LDI r2, 338
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
