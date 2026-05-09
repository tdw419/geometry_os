; DESCRIPTION: Places a magenta line segment connecting (470, 39) to (461, 215).
; PLAN: r0=470(x1), r1=39(y1), r2=461(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 39
LDI r2, 461
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
