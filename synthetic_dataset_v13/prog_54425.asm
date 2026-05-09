; DESCRIPTION: Places a green line segment connecting (386, 151) to (490, 126).
; PLAN: r0=386(x1), r1=151(y1), r2=490(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 151
LDI r2, 490
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
