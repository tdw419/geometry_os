; DESCRIPTION: Renders a magenta line between points (467, 132) and (338, 125).
; PLAN: r0=467(x1), r1=132(y1), r2=338(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 132
LDI r2, 338
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
