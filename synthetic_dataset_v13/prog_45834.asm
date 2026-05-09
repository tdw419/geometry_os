; DESCRIPTION: Composite: Renders a white box of size 96x49 starting at (43, 189) then Places a blue dot at position (465, 68).
; PLAN: r0=43(x), r1=189(y), r2=96(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=68(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 43
LDI r1, 189
LDI r2, 96
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 68
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
