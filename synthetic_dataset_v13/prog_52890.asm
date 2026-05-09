; DESCRIPTION: Draws a magenta line from (333, 171) to (499, 54).
; PLAN: r0=333(x1), r1=171(y1), r2=499(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 171
LDI r2, 499
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
