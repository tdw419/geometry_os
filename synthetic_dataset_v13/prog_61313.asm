; DESCRIPTION: Draws a magenta line from (346, 175) to (35, 216).
; PLAN: r0=346(x1), r1=175(y1), r2=35(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 175
LDI r2, 35
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
