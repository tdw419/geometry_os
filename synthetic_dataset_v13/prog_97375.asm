; DESCRIPTION: Composite: Renders a blue box of size 102x85 starting at (216, 169) then Places a blue dot at position (248, 98).
; PLAN: r0=216(x), r1=169(y), r2=102(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=98(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 216
LDI r1, 169
LDI r2, 102
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 98
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
