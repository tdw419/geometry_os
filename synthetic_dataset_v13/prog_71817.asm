; DESCRIPTION: Draws a magenta line from (341, 132) to (255, 139).
; PLAN: r0=341(x1), r1=132(y1), r2=255(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 132
LDI r2, 255
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
