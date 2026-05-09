; DESCRIPTION: Places a blue line segment connecting (178, 252) to (298, 132).
; PLAN: r0=178(x1), r1=252(y1), r2=298(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 252
LDI r2, 298
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
