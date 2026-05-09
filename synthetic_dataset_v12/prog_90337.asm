; DESCRIPTION: Draws a magenta line from (298, 28) to (270, 206).
; PLAN: r0=298(x1), r1=28(y1), r2=270(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 28
LDI r2, 270
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
