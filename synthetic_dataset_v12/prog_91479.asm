; DESCRIPTION: Places a cyan line segment connecting (453, 159) to (218, 87).
; PLAN: r0=453(x1), r1=159(y1), r2=218(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 159
LDI r2, 218
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
