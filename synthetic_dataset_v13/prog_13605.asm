; DESCRIPTION: Composite: Places a green dot at position (150, 100) then Draws a green circle centered at (249, 142) with radius 61 then Places a cyan line segment connecting (70, 145) to (20, 136).
; PLAN: r0=150(x), r1=100(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=142(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=70(x1), r11=145(y1), r12=20(x2), r13=136(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 100
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 249
LDI r6, 142
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 70
LDI r11, 145
LDI r12, 20
LDI r13, 136
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
