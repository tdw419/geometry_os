; DESCRIPTION: Draws a purple line from (46, 114) to (242, 104).
; PLAN: r0=46(x1), r1=114(y1), r2=242(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 114
LDI r2, 242
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
