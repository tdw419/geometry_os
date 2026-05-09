; DESCRIPTION: Composite: Creates a orange circular shape at (380, 196) with radius 51 then Places a white line segment connecting (275, 221) to (271, 235) then Draws a yellow rectangle at (285, 44) with width 45 and height 11.
; PLAN: r0=380(x), r1=196(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x1), r6=221(y1), r7=271(x2), r8=235(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=285(x), r11=44(y), r12=45(width), r13=11(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 196
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 221
LDI r7, 271
LDI r8, 235
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 44
LDI r12, 45
LDI r13, 11
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
