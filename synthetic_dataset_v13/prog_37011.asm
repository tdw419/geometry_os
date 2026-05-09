; DESCRIPTION: Composite: Places a magenta dot at position (207, 204) then Draws a blue circle centered at (437, 103) with radius 71 then Places a orange 94x52 rectangle at position (97, 107).
; PLAN: r0=207(x), r1=204(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=437(x), r6=103(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=97(x), r11=107(y), r12=94(width), r13=52(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 204
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 437
LDI r6, 103
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 97
LDI r11, 107
LDI r12, 94
LDI r13, 52
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
