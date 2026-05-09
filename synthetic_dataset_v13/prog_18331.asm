; DESCRIPTION: Composite: Renders a yellow line between points (146, 76) and (433, 155) then Renders a yellow box of size 31x100 starting at (60, 127).
; PLAN: r0=146(x1), r1=76(y1), r2=433(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=127(y), r7=31(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 76
LDI r2, 433
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 127
LDI r7, 31
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
