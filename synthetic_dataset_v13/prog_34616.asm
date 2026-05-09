; DESCRIPTION: Draws a magenta line from (294, 141) to (144, 20).
; PLAN: r0=294(x1), r1=141(y1), r2=144(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 141
LDI r2, 144
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
