; DESCRIPTION: Composite: Renders a blue box of size 118x16 starting at (39, 52) then Places a orange circle of radius 18 at center (171, 176).
; PLAN: r0=39(x), r1=52(y), r2=118(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=176(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 39
LDI r1, 52
LDI r2, 118
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 176
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
