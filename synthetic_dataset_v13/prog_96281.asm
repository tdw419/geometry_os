; DESCRIPTION: Composite: Renders a blue box of size 92x50 starting at (65, 76) then Places a orange dot at position (167, 179).
; PLAN: r0=65(x), r1=76(y), r2=92(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x), r6=179(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 65
LDI r1, 76
LDI r2, 92
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 179
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
