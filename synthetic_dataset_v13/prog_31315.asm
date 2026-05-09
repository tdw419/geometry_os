; DESCRIPTION: Composite: Draws a red circle centered at (365, 149) with radius 75 then Places a orange 52x101 rectangle at position (73, 153).
; PLAN: r0=365(x), r1=149(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=153(y), r7=52(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 149
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 153
LDI r7, 52
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
