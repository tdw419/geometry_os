; DESCRIPTION: Places a magenta line segment connecting (386, 40) to (126, 6).
; PLAN: r0=386(x1), r1=40(y1), r2=126(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 40
LDI r2, 126
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
