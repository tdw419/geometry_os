; DESCRIPTION: Draws a magenta line from (313, 180) to (175, 165).
; PLAN: r0=313(x1), r1=180(y1), r2=175(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 180
LDI r2, 175
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
