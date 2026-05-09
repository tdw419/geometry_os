; DESCRIPTION: Renders a magenta line between points (412, 80) and (288, 224).
; PLAN: r0=412(x1), r1=80(y1), r2=288(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 80
LDI r2, 288
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
