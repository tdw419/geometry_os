; DESCRIPTION: Composite: Draws a black rectangle at (403, 92) with width 27 and height 117 then Places a blue dot at position (222, 33).
; PLAN: r0=403(x), r1=92(y), r2=27(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x), r6=33(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 92
LDI r2, 27
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 33
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
