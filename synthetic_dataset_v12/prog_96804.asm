; DESCRIPTION: Composite: Draws a green circle centered at (271, 134) with radius 17 then Renders a black box of size 52x74 starting at (113, 86).
; PLAN: r0=271(x), r1=134(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=86(y), r7=52(width), r8=74(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 134
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 86
LDI r7, 52
LDI r8, 74
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
