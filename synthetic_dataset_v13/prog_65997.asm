; DESCRIPTION: Draws a magenta line from (215, 19) to (127, 117).
; PLAN: r0=215(x1), r1=19(y1), r2=127(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 19
LDI r2, 127
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
