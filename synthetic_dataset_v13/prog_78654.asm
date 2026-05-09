; DESCRIPTION: Draws a magenta line from (356, 64) to (482, 41).
; PLAN: r0=356(x1), r1=64(y1), r2=482(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 64
LDI r2, 482
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
