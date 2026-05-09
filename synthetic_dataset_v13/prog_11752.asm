; DESCRIPTION: Draws a magenta line from (225, 255) to (12, 36).
; PLAN: r0=225(x1), r1=255(y1), r2=12(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 255
LDI r2, 12
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
