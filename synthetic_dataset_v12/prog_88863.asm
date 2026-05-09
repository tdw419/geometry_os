; DESCRIPTION: Composite: Renders a white line between points (271, 5) and (504, 154) then Places a blue dot at position (388, 48) then Draws a green circle centered at (80, 171) with radius 61.
; PLAN: r0=271(x1), r1=5(y1), r2=504(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=48(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=80(x), r11=171(y), r12=61(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 271
LDI r1, 5
LDI r2, 504
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 48
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 80
LDI r11, 171
LDI r12, 61
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
