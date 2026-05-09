; DESCRIPTION: Composite: Draws a yellow circle centered at (296, 146) with radius 58 then Renders a yellow box of size 70x107 starting at (199, 86) then Places a magenta dot at position (312, 171).
; PLAN: r0=296(x), r1=146(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x), r6=86(y), r7=70(width), r8=107(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=312(x), r11=171(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 296
LDI r1, 146
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 86
LDI r7, 70
LDI r8, 107
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 171
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
