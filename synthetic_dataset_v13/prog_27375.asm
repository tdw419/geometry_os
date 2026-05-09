; DESCRIPTION: Draws a green line from (268, 38) to (72, 0).
; PLAN: r0=268(x1), r1=38(y1), r2=72(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 38
LDI r2, 72
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
