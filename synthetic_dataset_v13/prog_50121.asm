; DESCRIPTION: Places a magenta line segment connecting (455, 98) to (125, 29).
; PLAN: r0=455(x1), r1=98(y1), r2=125(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 98
LDI r2, 125
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
