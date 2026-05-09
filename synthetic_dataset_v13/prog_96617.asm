; DESCRIPTION: Composite: Draws a black rectangle at (21, 151) with width 107 and height 11 then Places a cyan dot at position (92, 172).
; PLAN: r0=21(x), r1=151(y), r2=107(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=92(x), r6=172(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 21
LDI r1, 151
LDI r2, 107
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 172
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
