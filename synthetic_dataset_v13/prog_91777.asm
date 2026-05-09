; DESCRIPTION: Draws a yellow line from (19, 110) to (230, 228).
; PLAN: r0=19(x1), r1=110(y1), r2=230(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 110
LDI r2, 230
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
