; DESCRIPTION: Places a cyan line segment connecting (100, 251) to (482, 107).
; PLAN: r0=100(x1), r1=251(y1), r2=482(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 251
LDI r2, 482
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
