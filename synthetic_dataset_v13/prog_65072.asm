; DESCRIPTION: Composite: Draws a cyan circle centered at (376, 75) with radius 41 then Renders a yellow box of size 68x45 starting at (40, 133).
; PLAN: r0=376(x), r1=75(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=133(y), r7=68(width), r8=45(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 75
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 133
LDI r7, 68
LDI r8, 45
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
