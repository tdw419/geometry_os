; DESCRIPTION: Composite: Creates a cyan circular shape at (349, 85) with radius 45 then Renders a green box of size 73x105 starting at (122, 51).
; PLAN: r0=349(x), r1=85(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=51(y), r7=73(width), r8=105(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 85
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 51
LDI r7, 73
LDI r8, 105
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
