; DESCRIPTION: Places a cyan line segment connecting (220, 217) to (132, 172).
; PLAN: r0=220(x1), r1=217(y1), r2=132(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 217
LDI r2, 132
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
