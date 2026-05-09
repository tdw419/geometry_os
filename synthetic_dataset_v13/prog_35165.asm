; DESCRIPTION: Draws a magenta line from (285, 192) to (202, 243).
; PLAN: r0=285(x1), r1=192(y1), r2=202(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 192
LDI r2, 202
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
