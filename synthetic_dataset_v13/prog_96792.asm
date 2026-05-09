; DESCRIPTION: Draws a magenta line from (196, 64) to (191, 134).
; PLAN: r0=196(x1), r1=64(y1), r2=191(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 64
LDI r2, 191
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
