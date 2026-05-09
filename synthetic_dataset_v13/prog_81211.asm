; DESCRIPTION: Draws a magenta line from (182, 81) to (295, 8).
; PLAN: r0=182(x1), r1=81(y1), r2=295(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 81
LDI r2, 295
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
