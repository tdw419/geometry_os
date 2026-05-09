; DESCRIPTION: Draws a magenta line from (399, 235) to (422, 27).
; PLAN: r0=399(x1), r1=235(y1), r2=422(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 235
LDI r2, 422
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
