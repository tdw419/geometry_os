; DESCRIPTION: Places a black line segment connecting (295, 192) to (386, 99).
; PLAN: r0=295(x1), r1=192(y1), r2=386(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 192
LDI r2, 386
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
