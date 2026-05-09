; DESCRIPTION: Composite: Renders a green box of size 19x67 starting at (63, 170) then Places a green dot at position (505, 124).
; PLAN: r0=63(x), r1=170(y), r2=19(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=505(x), r6=124(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 63
LDI r1, 170
LDI r2, 19
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 505
LDI r6, 124
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
