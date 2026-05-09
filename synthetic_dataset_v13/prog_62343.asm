; DESCRIPTION: Places a magenta line segment connecting (307, 127) to (103, 166).
; PLAN: r0=307(x1), r1=127(y1), r2=103(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 127
LDI r2, 103
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
