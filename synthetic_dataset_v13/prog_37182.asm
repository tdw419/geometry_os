; DESCRIPTION: Places a magenta line segment connecting (9, 167) to (367, 174).
; PLAN: r0=9(x1), r1=167(y1), r2=367(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 167
LDI r2, 367
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
