; DESCRIPTION: Composite: Renders a yellow box of size 114x52 starting at (122, 68) then Places a purple dot at position (29, 95).
; PLAN: r0=122(x), r1=68(y), r2=114(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x), r6=95(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 122
LDI r1, 68
LDI r2, 114
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 95
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
