; DESCRIPTION: Places a magenta line segment connecting (239, 245) to (7, 246).
; PLAN: r0=239(x1), r1=245(y1), r2=7(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 245
LDI r2, 7
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
