; DESCRIPTION: Draws a yellow line from (249, 68) to (152, 195).
; PLAN: r0=249(x1), r1=68(y1), r2=152(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 68
LDI r2, 152
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
