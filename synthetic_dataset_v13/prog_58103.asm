; DESCRIPTION: Places a purple line segment connecting (298, 31) to (346, 160).
; PLAN: r0=298(x1), r1=31(y1), r2=346(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 31
LDI r2, 346
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
