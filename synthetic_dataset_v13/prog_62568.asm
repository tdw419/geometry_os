; DESCRIPTION: Composite: Renders a orange disk with center (106, 71) and radius 56 then Draws a orange rectangle at (132, 195) with width 98 and height 28.
; PLAN: r0=106(x), r1=71(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=195(y), r7=98(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 71
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 195
LDI r7, 98
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
