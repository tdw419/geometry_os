; DESCRIPTION: Draws a magenta line from (496, 23) to (274, 213).
; PLAN: r0=496(x1), r1=23(y1), r2=274(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 23
LDI r2, 274
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
