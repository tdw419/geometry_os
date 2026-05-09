; DESCRIPTION: Places a green line segment connecting (381, 133) to (298, 19).
; PLAN: r0=381(x1), r1=133(y1), r2=298(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 133
LDI r2, 298
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
