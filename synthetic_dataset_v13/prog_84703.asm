; DESCRIPTION: Composite: Renders a purple disk with center (441, 134) and radius 10 then Draws a cyan rectangle at (231, 120) with width 76 and height 16.
; PLAN: r0=441(x), r1=134(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x), r6=120(y), r7=76(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 134
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 120
LDI r7, 76
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
