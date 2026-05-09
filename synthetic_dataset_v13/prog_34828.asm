; DESCRIPTION: Composite: Renders a yellow disk with center (100, 187) and radius 24 then Places a magenta 13x62 rectangle at position (472, 193).
; PLAN: r0=100(x), r1=187(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x), r6=193(y), r7=13(width), r8=62(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 187
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 193
LDI r7, 13
LDI r8, 62
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
