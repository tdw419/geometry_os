; DESCRIPTION: Draws a magenta line from (346, 181) to (386, 106).
; PLAN: r0=346(x1), r1=181(y1), r2=386(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 181
LDI r2, 386
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
