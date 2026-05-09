; DESCRIPTION: Composite: Renders a black box of size 110x69 starting at (210, 84) then Places a blue dot at position (44, 181).
; PLAN: r0=210(x), r1=84(y), r2=110(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=44(x), r6=181(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 210
LDI r1, 84
LDI r2, 110
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 181
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
