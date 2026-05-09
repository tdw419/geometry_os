; DESCRIPTION: Composite: Renders a blue box of size 46x82 starting at (112, 104) then Places a yellow dot at position (140, 166).
; PLAN: r0=112(x), r1=104(y), r2=46(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=166(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 112
LDI r1, 104
LDI r2, 46
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 166
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
