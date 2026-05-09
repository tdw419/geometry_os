; DESCRIPTION: Composite: Renders a purple box of size 80x37 starting at (321, 40) then Places a blue dot at position (72, 239).
; PLAN: r0=321(x), r1=40(y), r2=80(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=239(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 40
LDI r2, 80
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 239
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
