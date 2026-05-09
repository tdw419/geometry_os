; DESCRIPTION: Places a black line segment connecting (365, 56) to (446, 192).
; PLAN: r0=365(x1), r1=56(y1), r2=446(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 56
LDI r2, 446
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
