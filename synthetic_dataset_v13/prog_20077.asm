; DESCRIPTION: Composite: Places a blue line segment connecting (270, 173) to (253, 18) then Draws a white circle centered at (445, 164) with radius 29.
; PLAN: r0=270(x1), r1=173(y1), r2=253(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=445(x), r6=164(y), r7=29(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 270
LDI r1, 173
LDI r2, 253
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 164
LDI r7, 29
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
