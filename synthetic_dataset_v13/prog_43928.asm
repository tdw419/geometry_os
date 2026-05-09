; DESCRIPTION: Composite: Draws a orange circle centered at (269, 99) with radius 33 then Renders a blue line between points (450, 249) and (395, 38).
; PLAN: r0=269(x), r1=99(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x1), r6=249(y1), r7=395(x2), r8=38(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 99
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 249
LDI r7, 395
LDI r8, 38
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
