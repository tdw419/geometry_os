; DESCRIPTION: Composite: Creates a white circular shape at (150, 186) with radius 28 then Places a blue dot at position (171, 174) then Renders a white box of size 10x50 starting at (177, 155).
; PLAN: r0=150(x), r1=186(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=174(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=177(x), r11=155(y), r12=10(width), r13=50(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 186
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 174
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 177
LDI r11, 155
LDI r12, 10
LDI r13, 50
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
