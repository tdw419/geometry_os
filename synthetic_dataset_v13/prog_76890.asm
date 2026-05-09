; DESCRIPTION: Composite: Draws a white circle centered at (110, 204) with radius 33 then Renders a blue line between points (464, 178) and (364, 108).
; PLAN: r0=110(x), r1=204(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=464(x1), r6=178(y1), r7=364(x2), r8=108(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 204
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 464
LDI r6, 178
LDI r7, 364
LDI r8, 108
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
