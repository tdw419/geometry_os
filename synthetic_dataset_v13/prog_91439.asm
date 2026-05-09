; DESCRIPTION: Composite: Draws a black circle centered at (233, 97) with radius 53 then Places a black 45x27 rectangle at position (394, 177) then Places a white line segment connecting (371, 164) to (393, 11).
; PLAN: r0=233(x), r1=97(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x), r6=177(y), r7=45(width), r8=27(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x1), r11=164(y1), r12=393(x2), r13=11(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 97
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 177
LDI r7, 45
LDI r8, 27
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 164
LDI r12, 393
LDI r13, 11
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
