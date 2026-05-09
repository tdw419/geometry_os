; DESCRIPTION: Draws a yellow line from (436, 161) to (13, 228).
; PLAN: r0=436(x1), r1=161(y1), r2=13(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 161
LDI r2, 13
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
