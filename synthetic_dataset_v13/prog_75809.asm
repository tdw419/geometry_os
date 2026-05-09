; DESCRIPTION: Draws a magenta line from (243, 106) to (50, 220).
; PLAN: r0=243(x1), r1=106(y1), r2=50(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 106
LDI r2, 50
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
