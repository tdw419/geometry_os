; DESCRIPTION: Places a magenta line segment connecting (215, 86) to (247, 71).
; PLAN: r0=215(x1), r1=86(y1), r2=247(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 86
LDI r2, 247
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
