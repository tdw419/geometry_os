; DESCRIPTION: Draws a magenta line from (19, 103) to (128, 98).
; PLAN: r0=19(x1), r1=103(y1), r2=128(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 103
LDI r2, 128
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
