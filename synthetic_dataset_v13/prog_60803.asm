; DESCRIPTION: Composite: Draws a black rectangle at (407, 166) with width 90 and height 47 then Places a black dot at position (226, 210).
; PLAN: r0=407(x), r1=166(y), r2=90(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=210(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 407
LDI r1, 166
LDI r2, 90
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 210
LDI r7, 0x000000
PSET r5, r6, r7
HALT
