; DESCRIPTION: Composite: Places a purple dot at position (322, 164) then Draws a yellow circle centered at (198, 111) with radius 48 then Draws a orange rectangle at (47, 196) with width 110 and height 41.
; PLAN: r0=322(x), r1=164(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=198(x), r6=111(y), r7=48(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=47(x), r11=196(y), r12=110(width), r13=41(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 164
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 198
LDI r6, 111
LDI r7, 48
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 47
LDI r11, 196
LDI r12, 110
LDI r13, 41
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
