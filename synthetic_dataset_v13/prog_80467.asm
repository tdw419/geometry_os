; DESCRIPTION: Draws a magenta line from (164, 248) to (176, 117).
; PLAN: r0=164(x1), r1=248(y1), r2=176(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 248
LDI r2, 176
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
