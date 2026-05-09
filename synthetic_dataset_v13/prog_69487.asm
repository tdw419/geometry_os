; DESCRIPTION: Places a magenta line segment connecting (117, 209) to (152, 8).
; PLAN: r0=117(x1), r1=209(y1), r2=152(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 209
LDI r2, 152
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
