; DESCRIPTION: Places a magenta line segment connecting (120, 71) to (215, 250).
; PLAN: r0=120(x1), r1=71(y1), r2=215(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 71
LDI r2, 215
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
