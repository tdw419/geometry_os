; DESCRIPTION: Places a magenta line segment connecting (327, 68) to (294, 206).
; PLAN: r0=327(x1), r1=68(y1), r2=294(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 68
LDI r2, 294
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
