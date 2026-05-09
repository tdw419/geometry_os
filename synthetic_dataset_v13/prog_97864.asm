; DESCRIPTION: Composite: Renders a purple disk with center (258, 215) and radius 37 then Draws a cyan rectangle at (68, 60) with width 89 and height 95.
; PLAN: r0=258(x), r1=215(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=60(y), r7=89(width), r8=95(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 215
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 60
LDI r7, 89
LDI r8, 95
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
