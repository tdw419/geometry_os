; DESCRIPTION: Draws a magenta line from (431, 146) to (228, 108).
; PLAN: r0=431(x1), r1=146(y1), r2=228(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 146
LDI r2, 228
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
