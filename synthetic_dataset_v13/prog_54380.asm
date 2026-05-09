; DESCRIPTION: Places a magenta line segment connecting (206, 213) to (493, 184).
; PLAN: r0=206(x1), r1=213(y1), r2=493(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 213
LDI r2, 493
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
