; DESCRIPTION: Places a magenta line segment connecting (294, 19) to (146, 4).
; PLAN: r0=294(x1), r1=19(y1), r2=146(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 19
LDI r2, 146
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
