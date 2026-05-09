; DESCRIPTION: Places a magenta line segment connecting (244, 209) to (45, 154).
; PLAN: r0=244(x1), r1=209(y1), r2=45(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 209
LDI r2, 45
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
