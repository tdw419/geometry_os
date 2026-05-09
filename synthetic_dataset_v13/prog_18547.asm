; DESCRIPTION: Draws a magenta line from (220, 239) to (289, 67).
; PLAN: r0=220(x1), r1=239(y1), r2=289(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 239
LDI r2, 289
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
