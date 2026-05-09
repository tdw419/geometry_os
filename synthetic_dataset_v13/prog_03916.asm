; DESCRIPTION: Draws a magenta line from (367, 196) to (313, 67).
; PLAN: r0=367(x1), r1=196(y1), r2=313(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 196
LDI r2, 313
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
