; DESCRIPTION: Draws a blue line from (485, 194) to (228, 118).
; PLAN: r0=485(x1), r1=194(y1), r2=228(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 194
LDI r2, 228
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
