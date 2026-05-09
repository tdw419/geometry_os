; DESCRIPTION: Draws a blue line from (152, 32) to (273, 33).
; PLAN: r0=152(x1), r1=32(y1), r2=273(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 32
LDI r2, 273
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
