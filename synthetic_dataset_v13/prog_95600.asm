; DESCRIPTION: Draws a magenta line from (305, 74) to (492, 182).
; PLAN: r0=305(x1), r1=74(y1), r2=492(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 74
LDI r2, 492
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
