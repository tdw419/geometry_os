; DESCRIPTION: Places a magenta line segment connecting (79, 225) to (126, 172).
; PLAN: r0=79(x1), r1=225(y1), r2=126(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 225
LDI r2, 126
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
