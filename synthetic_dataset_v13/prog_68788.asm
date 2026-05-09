; DESCRIPTION: Places a magenta line segment connecting (234, 206) to (484, 213).
; PLAN: r0=234(x1), r1=206(y1), r2=484(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 206
LDI r2, 484
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
