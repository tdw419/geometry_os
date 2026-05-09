; DESCRIPTION: Draws a magenta line from (17, 186) to (120, 48).
; PLAN: r0=17(x1), r1=186(y1), r2=120(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 186
LDI r2, 120
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
