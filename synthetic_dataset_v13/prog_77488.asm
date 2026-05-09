; DESCRIPTION: Places a magenta line segment connecting (315, 111) to (332, 156).
; PLAN: r0=315(x1), r1=111(y1), r2=332(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 111
LDI r2, 332
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
