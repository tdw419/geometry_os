; DESCRIPTION: Composite: Renders a white box of size 103x46 starting at (197, 132) then Draws a orange circle centered at (321, 89) with radius 29.
; PLAN: r0=197(x), r1=132(y), r2=103(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=89(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 197
LDI r1, 132
LDI r2, 103
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 89
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
