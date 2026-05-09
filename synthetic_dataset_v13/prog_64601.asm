; DESCRIPTION: Places a yellow line segment connecting (313, 42) to (364, 249).
; PLAN: r0=313(x1), r1=42(y1), r2=364(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 42
LDI r2, 364
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
