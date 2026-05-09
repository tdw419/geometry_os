; DESCRIPTION: Draws a magenta line from (442, 239) to (61, 56).
; PLAN: r0=442(x1), r1=239(y1), r2=61(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 239
LDI r2, 61
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
