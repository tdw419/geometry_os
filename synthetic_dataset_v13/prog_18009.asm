; DESCRIPTION: Places a magenta line segment connecting (50, 215) to (446, 145).
; PLAN: r0=50(x1), r1=215(y1), r2=446(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 215
LDI r2, 446
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
