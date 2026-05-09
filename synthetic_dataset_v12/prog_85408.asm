; DESCRIPTION: Draws a magenta line from (424, 27) to (365, 159).
; PLAN: r0=424(x1), r1=27(y1), r2=365(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 27
LDI r2, 365
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
