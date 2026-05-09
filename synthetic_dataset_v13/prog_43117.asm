; DESCRIPTION: Places a magenta line segment connecting (459, 182) to (104, 254).
; PLAN: r0=459(x1), r1=182(y1), r2=104(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 182
LDI r2, 104
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
