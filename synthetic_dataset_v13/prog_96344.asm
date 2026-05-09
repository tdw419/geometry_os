; DESCRIPTION: Composite: Places a green circle of radius 10 at center (44, 58) then Renders a white box of size 56x104 starting at (346, 95) then Places a black dot at position (80, 217).
; PLAN: r0=44(x), r1=58(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=95(y), r7=56(width), r8=104(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x), r11=217(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 44
LDI r1, 58
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 95
LDI r7, 56
LDI r8, 104
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 217
LDI r12, 0x000000
PSET r10, r11, r12
HALT
