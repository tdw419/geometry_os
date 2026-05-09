; DESCRIPTION: Places a yellow line segment connecting (319, 27) to (90, 50).
; PLAN: r0=319(x1), r1=27(y1), r2=90(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 27
LDI r2, 90
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
