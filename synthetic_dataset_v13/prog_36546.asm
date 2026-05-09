; DESCRIPTION: Composite: Creates a orange circular shape at (214, 37) with radius 26 then Renders a blue box of size 57x18 starting at (359, 92).
; PLAN: r0=214(x), r1=37(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x), r6=92(y), r7=57(width), r8=18(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 37
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 92
LDI r7, 57
LDI r8, 18
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
