; DESCRIPTION: Composite: Renders a green box of size 14x108 starting at (296, 12) then Places a green circle of radius 10 at center (108, 207).
; PLAN: r0=296(x), r1=12(y), r2=14(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=207(y), r7=10(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 12
LDI r2, 14
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 207
LDI r7, 10
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
