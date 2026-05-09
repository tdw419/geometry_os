; DESCRIPTION: Places a magenta line segment connecting (91, 194) to (197, 241).
; PLAN: r0=91(x1), r1=194(y1), r2=197(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 194
LDI r2, 197
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
