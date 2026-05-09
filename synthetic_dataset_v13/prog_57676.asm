; DESCRIPTION: Places a magenta line segment connecting (294, 57) to (198, 24).
; PLAN: r0=294(x1), r1=57(y1), r2=198(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 57
LDI r2, 198
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
