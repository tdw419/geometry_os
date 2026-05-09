; DESCRIPTION: Draws a magenta line from (11, 59) to (123, 192).
; PLAN: r0=11(x1), r1=59(y1), r2=123(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 59
LDI r2, 123
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
