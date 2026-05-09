; DESCRIPTION: Draws a magenta line from (75, 126) to (70, 8).
; PLAN: r0=75(x1), r1=126(y1), r2=70(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 126
LDI r2, 70
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
