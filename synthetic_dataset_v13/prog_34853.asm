; DESCRIPTION: Composite: Creates a red rectangular region at (199, 130) spanning 25 by 10 pixels then Places a cyan dot at position (162, 254).
; PLAN: r0=199(x), r1=130(y), r2=25(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x), r6=254(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 199
LDI r1, 130
LDI r2, 25
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 254
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
