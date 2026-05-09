; DESCRIPTION: Places a magenta line segment connecting (473, 125) to (126, 146).
; PLAN: r0=473(x1), r1=125(y1), r2=126(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 125
LDI r2, 126
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
