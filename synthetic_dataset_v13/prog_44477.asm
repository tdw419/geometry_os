; DESCRIPTION: Places a black line segment connecting (220, 15) to (295, 179).
; PLAN: r0=220(x1), r1=15(y1), r2=295(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 15
LDI r2, 295
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
