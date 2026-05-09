; DESCRIPTION: Draws a green line from (482, 138) to (268, 78).
; PLAN: r0=482(x1), r1=138(y1), r2=268(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 138
LDI r2, 268
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
