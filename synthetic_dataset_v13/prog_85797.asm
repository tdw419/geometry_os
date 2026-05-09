; DESCRIPTION: Composite: Renders a orange box of size 61x101 starting at (145, 52) then Places a green circle of radius 18 at center (453, 166).
; PLAN: r0=145(x), r1=52(y), r2=61(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x), r6=166(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 145
LDI r1, 52
LDI r2, 61
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 166
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
