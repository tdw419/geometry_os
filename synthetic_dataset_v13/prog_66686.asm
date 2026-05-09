; DESCRIPTION: Draws a yellow line from (114, 208) to (405, 152).
; PLAN: r0=114(x1), r1=208(y1), r2=405(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 208
LDI r2, 405
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
