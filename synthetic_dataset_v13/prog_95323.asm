; DESCRIPTION: Composite: Renders a orange box of size 49x82 starting at (5, 63) then Places a purple dot at position (350, 117).
; PLAN: r0=5(x), r1=63(y), r2=49(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=117(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 5
LDI r1, 63
LDI r2, 49
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 117
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
