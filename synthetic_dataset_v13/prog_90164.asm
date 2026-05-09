; DESCRIPTION: Draws a magenta line from (196, 78) to (460, 187).
; PLAN: r0=196(x1), r1=78(y1), r2=460(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 78
LDI r2, 460
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
