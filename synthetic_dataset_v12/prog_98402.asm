; DESCRIPTION: Draws a magenta line from (252, 133) to (482, 164).
; PLAN: r0=252(x1), r1=133(y1), r2=482(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 133
LDI r2, 482
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
