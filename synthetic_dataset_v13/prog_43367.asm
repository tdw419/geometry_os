; DESCRIPTION: Places a cyan line segment connecting (387, 9) to (318, 44).
; PLAN: r0=387(x1), r1=9(y1), r2=318(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 9
LDI r2, 318
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
