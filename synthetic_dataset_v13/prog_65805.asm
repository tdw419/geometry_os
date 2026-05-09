; DESCRIPTION: Renders a magenta line between points (13, 242) and (152, 248).
; PLAN: r0=13(x1), r1=242(y1), r2=152(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 242
LDI r2, 152
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
