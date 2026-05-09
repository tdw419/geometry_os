; DESCRIPTION: Places a yellow line segment connecting (338, 46) to (295, 245).
; PLAN: r0=338(x1), r1=46(y1), r2=295(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 46
LDI r2, 295
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
