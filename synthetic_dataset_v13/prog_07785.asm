; DESCRIPTION: Composite: Draws a orange line from (411, 51) to (83, 34) then Renders a yellow box of size 92x117 starting at (61, 24).
; PLAN: r0=411(x1), r1=51(y1), r2=83(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=24(y), r7=92(width), r8=117(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 411
LDI r1, 51
LDI r2, 83
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 24
LDI r7, 92
LDI r8, 117
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
