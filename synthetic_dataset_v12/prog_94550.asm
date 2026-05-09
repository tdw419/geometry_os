; DESCRIPTION: Composite: Draws a white circle centered at (443, 96) with radius 62 then Renders a blue line between points (265, 150) and (428, 14).
; PLAN: r0=443(x), r1=96(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x1), r6=150(y1), r7=428(x2), r8=14(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 96
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 150
LDI r7, 428
LDI r8, 14
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
