; DESCRIPTION: Draws a magenta line from (443, 166) to (263, 39).
; PLAN: r0=443(x1), r1=166(y1), r2=263(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 166
LDI r2, 263
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
