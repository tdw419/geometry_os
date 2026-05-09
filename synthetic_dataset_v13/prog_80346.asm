; DESCRIPTION: Places a magenta line segment connecting (386, 73) to (119, 83).
; PLAN: r0=386(x1), r1=73(y1), r2=119(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 73
LDI r2, 119
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
