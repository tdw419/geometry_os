; DESCRIPTION: Draws a magenta line from (219, 206) to (307, 209).
; PLAN: r0=219(x1), r1=206(y1), r2=307(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 206
LDI r2, 307
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
