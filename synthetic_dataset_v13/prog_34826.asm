; DESCRIPTION: Composite: Renders a red line between points (360, 79) and (49, 249) then Draws a white circle centered at (300, 153) with radius 16.
; PLAN: r0=360(x1), r1=79(y1), r2=49(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=153(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 79
LDI r2, 49
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 153
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
