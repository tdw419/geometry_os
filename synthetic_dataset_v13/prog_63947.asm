; DESCRIPTION: Places a magenta line segment connecting (69, 180) to (126, 215).
; PLAN: r0=69(x1), r1=180(y1), r2=126(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 180
LDI r2, 126
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
