; DESCRIPTION: Composite: Draws a black line from (25, 94) to (134, 162) then Renders a yellow box of size 107x48 starting at (82, 53).
; PLAN: r0=25(x1), r1=94(y1), r2=134(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=53(y), r7=107(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 94
LDI r2, 134
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 53
LDI r7, 107
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
