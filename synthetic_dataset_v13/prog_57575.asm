; DESCRIPTION: Composite: Sets a single black pixel at (194, 59) then Places a white line segment connecting (433, 93) to (409, 165) then Places a blue 32x28 rectangle at position (43, 174).
; PLAN: r0=194(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=433(x1), r6=93(y1), r7=409(x2), r8=165(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=43(x), r11=174(y), r12=32(width), r13=28(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 59
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 433
LDI r6, 93
LDI r7, 409
LDI r8, 165
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 174
LDI r12, 32
LDI r13, 28
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
