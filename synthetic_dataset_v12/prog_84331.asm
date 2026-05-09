; DESCRIPTION: Composite: Renders a purple box of size 78x68 starting at (421, 166) then Places a yellow dot at position (29, 172).
; PLAN: r0=421(x), r1=166(y), r2=78(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x), r6=172(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 166
LDI r2, 78
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 172
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
