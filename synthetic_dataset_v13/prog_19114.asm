; DESCRIPTION: Places a magenta line segment connecting (365, 203) to (372, 198).
; PLAN: r0=365(x1), r1=203(y1), r2=372(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 203
LDI r2, 372
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
