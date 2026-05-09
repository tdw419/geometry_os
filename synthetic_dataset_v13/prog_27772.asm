; DESCRIPTION: Draws a purple line from (384, 72) to (383, 154).
; PLAN: r0=384(x1), r1=72(y1), r2=383(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 72
LDI r2, 383
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
