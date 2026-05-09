; DESCRIPTION: Composite: Creates a blue circular shape at (371, 73) with radius 71 then Draws a orange line from (117, 198) to (445, 112).
; PLAN: r0=371(x), r1=73(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x1), r6=198(y1), r7=445(x2), r8=112(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 73
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 198
LDI r7, 445
LDI r8, 112
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
