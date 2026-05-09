; DESCRIPTION: Composite: Creates a white circular shape at (342, 113) with radius 80 then Places a blue dot at position (346, 13) then Places a magenta line segment connecting (230, 78) to (325, 182).
; PLAN: r0=342(x), r1=113(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=13(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=230(x1), r11=78(y1), r12=325(x2), r13=182(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 113
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 13
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 230
LDI r11, 78
LDI r12, 325
LDI r13, 182
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
