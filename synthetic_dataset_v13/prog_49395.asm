; DESCRIPTION: Composite: Creates a white circular shape at (250, 234) with radius 15 then Renders a blue line between points (146, 61) and (327, 95).
; PLAN: r0=250(x), r1=234(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x1), r6=61(y1), r7=327(x2), r8=95(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 234
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 61
LDI r7, 327
LDI r8, 95
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
