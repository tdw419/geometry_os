; DESCRIPTION: Draws a magenta line from (230, 146) to (364, 237).
; PLAN: r0=230(x1), r1=146(y1), r2=364(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 146
LDI r2, 364
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
