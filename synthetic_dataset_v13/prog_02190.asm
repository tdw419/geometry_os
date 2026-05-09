; DESCRIPTION: Composite: Renders a red box of size 89x25 starting at (272, 116) then Places a black circle of radius 75 at center (370, 176).
; PLAN: r0=272(x), r1=116(y), r2=89(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=176(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 272
LDI r1, 116
LDI r2, 89
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 176
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
