; DESCRIPTION: Draws a magenta line from (464, 71) to (500, 5).
; PLAN: r0=464(x1), r1=71(y1), r2=500(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 71
LDI r2, 500
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
