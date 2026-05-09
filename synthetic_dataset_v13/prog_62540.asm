; DESCRIPTION: Draws a magenta line from (255, 175) to (510, 98).
; PLAN: r0=255(x1), r1=175(y1), r2=510(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 175
LDI r2, 510
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
