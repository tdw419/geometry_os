; DESCRIPTION: Places a magenta line segment connecting (243, 105) to (284, 147).
; PLAN: r0=243(x1), r1=105(y1), r2=284(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 105
LDI r2, 284
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
