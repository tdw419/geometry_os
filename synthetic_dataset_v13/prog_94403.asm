; DESCRIPTION: Renders a magenta line between points (278, 230) and (162, 209).
; PLAN: r0=278(x1), r1=230(y1), r2=162(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 230
LDI r2, 162
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
