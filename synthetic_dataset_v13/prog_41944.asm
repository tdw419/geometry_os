; DESCRIPTION: Composite: Renders a yellow box of size 18x48 starting at (327, 50) then Places a purple dot at position (506, 157).
; PLAN: r0=327(x), r1=50(y), r2=18(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=506(x), r6=157(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 50
LDI r2, 18
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 157
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
