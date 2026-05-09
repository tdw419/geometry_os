; DESCRIPTION: Places a blue line segment connecting (361, 213) to (307, 254).
; PLAN: r0=361(x1), r1=213(y1), r2=307(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 213
LDI r2, 307
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
