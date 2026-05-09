; DESCRIPTION: Composite: Renders a orange box of size 60x100 starting at (285, 96) then Places a blue dot at position (274, 241).
; PLAN: r0=285(x), r1=96(y), r2=60(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x), r6=241(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 96
LDI r2, 60
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 241
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
