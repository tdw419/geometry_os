; DESCRIPTION: Draws a purple line from (242, 102) to (264, 228).
; PLAN: r0=242(x1), r1=102(y1), r2=264(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 102
LDI r2, 264
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
