; DESCRIPTION: Composite: Renders a white line between points (168, 245) and (294, 140) then Draws a yellow circle centered at (432, 73) with radius 61 then Places a white 88x66 rectangle at position (402, 0).
; PLAN: r0=168(x1), r1=245(y1), r2=294(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=73(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=402(x), r11=0(y), r12=88(width), r13=66(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 245
LDI r2, 294
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 73
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 402
LDI r11, 0
LDI r12, 88
LDI r13, 66
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
