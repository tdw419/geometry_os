; DESCRIPTION: Places a magenta line segment connecting (319, 34) to (363, 215).
; PLAN: r0=319(x1), r1=34(y1), r2=363(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 34
LDI r2, 363
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
