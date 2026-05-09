; DESCRIPTION: Composite: Renders a green disk with center (306, 67) and radius 45 then Places a orange dot at position (501, 135).
; PLAN: r0=306(x), r1=67(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=501(x), r6=135(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 306
LDI r1, 67
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 501
LDI r6, 135
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
