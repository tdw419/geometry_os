; DESCRIPTION: Composite: Renders a purple box of size 70x118 starting at (42, 55) then Places a red dot at position (474, 25).
; PLAN: r0=42(x), r1=55(y), r2=70(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x), r6=25(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 55
LDI r2, 70
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 25
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
