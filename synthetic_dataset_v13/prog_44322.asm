; DESCRIPTION: Places a magenta line segment connecting (243, 241) to (319, 146).
; PLAN: r0=243(x1), r1=241(y1), r2=319(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 241
LDI r2, 319
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
