; DESCRIPTION: Draws a black line from (104, 38) to (294, 216).
; PLAN: r0=104(x1), r1=38(y1), r2=294(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 38
LDI r2, 294
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
