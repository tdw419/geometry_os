; DESCRIPTION: Places a black line segment connecting (386, 14) to (434, 87).
; PLAN: r0=386(x1), r1=14(y1), r2=434(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 14
LDI r2, 434
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
