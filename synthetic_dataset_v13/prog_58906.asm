; DESCRIPTION: Draws a magenta line from (240, 48) to (304, 232).
; PLAN: r0=240(x1), r1=48(y1), r2=304(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 48
LDI r2, 304
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
