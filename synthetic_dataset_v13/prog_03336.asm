; DESCRIPTION: Composite: Renders a yellow box of size 50x117 starting at (90, 18) then Places a magenta dot at position (31, 181).
; PLAN: r0=90(x), r1=18(y), r2=50(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x), r6=181(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 18
LDI r2, 50
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 181
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
