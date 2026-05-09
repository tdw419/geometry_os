; DESCRIPTION: Composite: Places a yellow line segment connecting (136, 223) to (181, 120) then Renders a yellow box of size 118x50 starting at (138, 142).
; PLAN: r0=136(x1), r1=223(y1), r2=181(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=142(y), r7=118(width), r8=50(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 223
LDI r2, 181
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 142
LDI r7, 118
LDI r8, 50
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
