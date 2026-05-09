; DESCRIPTION: Composite: Draws a black circle centered at (137, 146) with radius 77 then Renders a purple box of size 88x54 starting at (150, 54).
; PLAN: r0=137(x), r1=146(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=54(y), r7=88(width), r8=54(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 146
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 54
LDI r7, 88
LDI r8, 54
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
