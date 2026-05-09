; DESCRIPTION: Places a magenta line segment connecting (46, 128) to (131, 176).
; PLAN: r0=46(x1), r1=128(y1), r2=131(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 128
LDI r2, 131
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
