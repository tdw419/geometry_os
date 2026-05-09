; DESCRIPTION: Draws a magenta line from (309, 223) to (264, 5).
; PLAN: r0=309(x1), r1=223(y1), r2=264(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 223
LDI r2, 264
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
