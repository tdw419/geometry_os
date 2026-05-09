; DESCRIPTION: Draws a magenta line from (261, 5) to (305, 60).
; PLAN: r0=261(x1), r1=5(y1), r2=305(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 5
LDI r2, 305
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
