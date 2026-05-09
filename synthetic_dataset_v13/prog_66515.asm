; DESCRIPTION: Draws a magenta line from (57, 154) to (278, 225).
; PLAN: r0=57(x1), r1=154(y1), r2=278(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 154
LDI r2, 278
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
