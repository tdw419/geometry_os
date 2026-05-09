; DESCRIPTION: Composite: Renders a cyan box of size 94x116 starting at (330, 105) then Places a blue dot at position (58, 217).
; PLAN: r0=330(x), r1=105(y), r2=94(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x), r6=217(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 330
LDI r1, 105
LDI r2, 94
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 217
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
