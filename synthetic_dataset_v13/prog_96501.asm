; DESCRIPTION: Draws a magenta line from (450, 205) to (435, 98).
; PLAN: r0=450(x1), r1=205(y1), r2=435(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 205
LDI r2, 435
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
