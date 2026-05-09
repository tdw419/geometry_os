; DESCRIPTION: Composite: Renders a yellow box of size 103x32 starting at (105, 8) then Draws a orange circle centered at (120, 177) with radius 41.
; PLAN: r0=105(x), r1=8(y), r2=103(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=177(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 8
LDI r2, 103
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 177
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
