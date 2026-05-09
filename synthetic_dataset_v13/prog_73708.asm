; DESCRIPTION: Places a magenta line segment connecting (295, 4) to (393, 206).
; PLAN: r0=295(x1), r1=4(y1), r2=393(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 4
LDI r2, 393
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
