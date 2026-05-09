; DESCRIPTION: Draws a magenta line from (67, 220) to (32, 60).
; PLAN: r0=67(x1), r1=220(y1), r2=32(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 220
LDI r2, 32
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
