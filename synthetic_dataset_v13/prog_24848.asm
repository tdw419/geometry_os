; DESCRIPTION: Composite: Renders a white box of size 40x106 starting at (436, 98) then Places a yellow dot at position (81, 127).
; PLAN: r0=436(x), r1=98(y), r2=40(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=127(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 98
LDI r2, 40
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 127
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
