; DESCRIPTION: Draws a magenta line from (413, 17) to (237, 239).
; PLAN: r0=413(x1), r1=17(y1), r2=237(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 17
LDI r2, 237
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
