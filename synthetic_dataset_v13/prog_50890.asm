; DESCRIPTION: Draws a magenta line from (288, 231) to (400, 57).
; PLAN: r0=288(x1), r1=231(y1), r2=400(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 231
LDI r2, 400
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
