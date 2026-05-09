; DESCRIPTION: Places a cyan line segment connecting (147, 46) to (19, 76).
; PLAN: r0=147(x1), r1=46(y1), r2=19(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 46
LDI r2, 19
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
