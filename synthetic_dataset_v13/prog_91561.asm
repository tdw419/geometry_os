; DESCRIPTION: Places a red line segment connecting (298, 67) to (351, 26).
; PLAN: r0=298(x1), r1=67(y1), r2=351(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 67
LDI r2, 351
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
