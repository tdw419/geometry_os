; DESCRIPTION: Places a magenta line segment connecting (288, 239) to (152, 129).
; PLAN: r0=288(x1), r1=239(y1), r2=152(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 239
LDI r2, 152
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
