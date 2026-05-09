; DESCRIPTION: Places a magenta line segment connecting (442, 177) to (289, 209).
; PLAN: r0=442(x1), r1=177(y1), r2=289(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 177
LDI r2, 289
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
