; DESCRIPTION: Composite: Renders a red box of size 104x86 starting at (45, 111) then Places a blue dot at position (6, 52).
; PLAN: r0=45(x), r1=111(y), r2=104(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=6(x), r6=52(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 45
LDI r1, 111
LDI r2, 104
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 52
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
