; DESCRIPTION: Places a magenta line segment connecting (321, 35) to (284, 169).
; PLAN: r0=321(x1), r1=35(y1), r2=284(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 35
LDI r2, 284
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
