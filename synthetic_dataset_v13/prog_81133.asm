; DESCRIPTION: Composite: Creates a white rectangular region at (218, 35) spanning 81 by 16 pixels then Places a green dot at position (230, 221) then Draws a orange circle centered at (482, 171) with radius 21.
; PLAN: r0=218(x), r1=35(y), r2=81(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=221(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=482(x), r11=171(y), r12=21(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 218
LDI r1, 35
LDI r2, 81
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 221
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 482
LDI r11, 171
LDI r12, 21
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
