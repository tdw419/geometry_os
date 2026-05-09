; DESCRIPTION: Places a magenta line segment connecting (364, 35) to (264, 38).
; PLAN: r0=364(x1), r1=35(y1), r2=264(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 35
LDI r2, 264
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
