; DESCRIPTION: Draws a magenta line from (420, 67) to (225, 177).
; PLAN: r0=420(x1), r1=67(y1), r2=225(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 67
LDI r2, 225
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
