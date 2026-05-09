; DESCRIPTION: Draws a magenta line from (372, 128) to (213, 140).
; PLAN: r0=372(x1), r1=128(y1), r2=213(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 128
LDI r2, 213
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
