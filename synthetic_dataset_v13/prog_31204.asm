; DESCRIPTION: Composite: Renders a purple box of size 79x40 starting at (140, 195) then Creates a purple circular shape at (425, 199) with radius 39 then Places a purple dot at position (247, 69).
; PLAN: r0=140(x), r1=195(y), r2=79(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x), r6=199(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=247(x), r11=69(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 140
LDI r1, 195
LDI r2, 79
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 199
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 247
LDI r11, 69
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
