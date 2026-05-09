; DESCRIPTION: Composite: Renders a cyan line between points (150, 104) and (105, 247) then Draws a yellow circle centered at (110, 144) with radius 29.
; PLAN: r0=150(x1), r1=104(y1), r2=105(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=144(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 150
LDI r1, 104
LDI r2, 105
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 144
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
