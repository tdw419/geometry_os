; DESCRIPTION: Composite: Renders a magenta line between points (94, 183) and (100, 157) then Places a yellow 58x22 rectangle at position (400, 21).
; PLAN: r0=94(x1), r1=183(y1), r2=100(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=21(y), r7=58(width), r8=22(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 183
LDI r2, 100
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 21
LDI r7, 58
LDI r8, 22
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
