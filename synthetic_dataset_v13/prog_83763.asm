; DESCRIPTION: Draws a magenta line from (116, 239) to (270, 84).
; PLAN: r0=116(x1), r1=239(y1), r2=270(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 239
LDI r2, 270
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
