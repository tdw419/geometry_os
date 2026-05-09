; DESCRIPTION: Composite: Renders a yellow box of size 118x105 starting at (199, 85) then Places a red dot at position (137, 91).
; PLAN: r0=199(x), r1=85(y), r2=118(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=91(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 199
LDI r1, 85
LDI r2, 118
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 91
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
