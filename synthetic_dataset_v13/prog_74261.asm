; DESCRIPTION: Places a magenta line segment connecting (7, 2) to (197, 213).
; PLAN: r0=7(x1), r1=2(y1), r2=197(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 2
LDI r2, 197
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
