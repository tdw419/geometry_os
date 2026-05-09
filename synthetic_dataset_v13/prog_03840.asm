; DESCRIPTION: Composite: Creates a cyan circular shape at (90, 75) with radius 51 then Places a magenta 20x32 rectangle at position (170, 171).
; PLAN: r0=90(x), r1=75(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=171(y), r7=20(width), r8=32(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 75
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 171
LDI r7, 20
LDI r8, 32
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
