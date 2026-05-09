; DESCRIPTION: Places a magenta line segment connecting (386, 143) to (250, 195).
; PLAN: r0=386(x1), r1=143(y1), r2=250(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 143
LDI r2, 250
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
