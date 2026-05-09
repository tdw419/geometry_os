; DESCRIPTION: Composite: Places a orange circle of radius 18 at center (382, 187) then Draws a purple rectangle at (401, 130) with width 23 and height 29.
; PLAN: r0=382(x), r1=187(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=130(y), r7=23(width), r8=29(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 187
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 130
LDI r7, 23
LDI r8, 29
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
