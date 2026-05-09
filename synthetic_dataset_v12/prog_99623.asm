; DESCRIPTION: Draws a magenta line from (416, 238) to (445, 77).
; PLAN: r0=416(x1), r1=238(y1), r2=445(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 238
LDI r2, 445
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
