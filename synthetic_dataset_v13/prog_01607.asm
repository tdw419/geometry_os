; DESCRIPTION: Places a magenta line segment connecting (344, 10) to (243, 113).
; PLAN: r0=344(x1), r1=10(y1), r2=243(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 10
LDI r2, 243
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
