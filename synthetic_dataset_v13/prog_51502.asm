; DESCRIPTION: Renders a green line between points (490, 132) and (307, 240).
; PLAN: r0=490(x1), r1=132(y1), r2=307(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 132
LDI r2, 307
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
