; DESCRIPTION: Draws a purple line from (67, 68) to (466, 213).
; PLAN: r0=67(x1), r1=68(y1), r2=466(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 68
LDI r2, 466
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
