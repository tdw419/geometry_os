; DESCRIPTION: Draws a yellow line from (67, 193) to (195, 186).
; PLAN: r0=67(x1), r1=193(y1), r2=195(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 193
LDI r2, 195
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
