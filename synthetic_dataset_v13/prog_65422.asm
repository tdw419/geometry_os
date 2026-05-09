; DESCRIPTION: Places a yellow line segment connecting (498, 182) to (263, 215).
; PLAN: r0=498(x1), r1=182(y1), r2=263(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 182
LDI r2, 263
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
