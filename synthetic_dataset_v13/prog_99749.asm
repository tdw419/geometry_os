; DESCRIPTION: Composite: Renders a red box of size 100x18 starting at (49, 224) then Places a purple dot at position (196, 43).
; PLAN: r0=49(x), r1=224(y), r2=100(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x), r6=43(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 49
LDI r1, 224
LDI r2, 100
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 43
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
