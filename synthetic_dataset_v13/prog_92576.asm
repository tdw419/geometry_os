; DESCRIPTION: Composite: Renders a green box of size 111x95 starting at (178, 141) then Places a black dot at position (306, 148).
; PLAN: r0=178(x), r1=141(y), r2=111(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=148(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 141
LDI r2, 111
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 148
LDI r7, 0x000000
PSET r5, r6, r7
HALT
