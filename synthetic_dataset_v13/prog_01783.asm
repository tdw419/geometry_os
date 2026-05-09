; DESCRIPTION: Draws a magenta line from (70, 124) to (80, 28).
; PLAN: r0=70(x1), r1=124(y1), r2=80(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 124
LDI r2, 80
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
