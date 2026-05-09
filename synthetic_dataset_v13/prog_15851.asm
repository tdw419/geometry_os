; DESCRIPTION: Places a magenta line segment connecting (248, 222) to (295, 153).
; PLAN: r0=248(x1), r1=222(y1), r2=295(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 222
LDI r2, 295
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
