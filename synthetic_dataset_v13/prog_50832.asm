; DESCRIPTION: Composite: Draws a white circle centered at (446, 229) with radius 24 then Places a black dot at position (460, 164) then Places a blue 78x120 rectangle at position (320, 50).
; PLAN: r0=446(x), r1=229(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x), r6=164(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=320(x), r11=50(y), r12=78(width), r13=120(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 229
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 164
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 320
LDI r11, 50
LDI r12, 78
LDI r13, 120
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
