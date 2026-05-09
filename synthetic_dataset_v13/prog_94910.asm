; DESCRIPTION: Draws a magenta line from (256, 142) to (295, 54).
; PLAN: r0=256(x1), r1=142(y1), r2=295(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 142
LDI r2, 295
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
