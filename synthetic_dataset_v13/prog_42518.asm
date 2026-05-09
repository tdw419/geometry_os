; DESCRIPTION: Places a magenta line segment connecting (18, 63) to (380, 113).
; PLAN: r0=18(x1), r1=63(y1), r2=380(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 63
LDI r2, 380
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
