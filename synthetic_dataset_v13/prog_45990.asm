; DESCRIPTION: Composite: Draws a green circle centered at (321, 125) with radius 56 then Renders a black box of size 68x38 starting at (36, 16).
; PLAN: r0=321(x), r1=125(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x), r6=16(y), r7=68(width), r8=38(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 125
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 16
LDI r7, 68
LDI r8, 38
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
