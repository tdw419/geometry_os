; DESCRIPTION: Places a magenta line segment connecting (253, 209) to (466, 239).
; PLAN: r0=253(x1), r1=209(y1), r2=466(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 209
LDI r2, 466
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
