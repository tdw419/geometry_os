; DESCRIPTION: Renders a magenta line between points (3, 32) and (482, 46).
; PLAN: r0=3(x1), r1=32(y1), r2=482(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 32
LDI r2, 482
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
