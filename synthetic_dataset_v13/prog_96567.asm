; DESCRIPTION: Draws a magenta line from (356, 39) to (328, 164).
; PLAN: r0=356(x1), r1=39(y1), r2=328(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 39
LDI r2, 328
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
