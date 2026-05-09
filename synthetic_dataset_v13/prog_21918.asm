; DESCRIPTION: Places a black line segment connecting (483, 152) to (175, 166).
; PLAN: r0=483(x1), r1=152(y1), r2=175(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 152
LDI r2, 175
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
