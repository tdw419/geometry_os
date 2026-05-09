; DESCRIPTION: Composite: Renders a orange box of size 50x67 starting at (65, 147) then Places a green circle of radius 62 at center (213, 145).
; PLAN: r0=65(x), r1=147(y), r2=50(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=145(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 65
LDI r1, 147
LDI r2, 50
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 145
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
