; DESCRIPTION: Composite: Places a cyan dot at position (125, 123) then Draws a black rectangle at (403, 17) with width 72 and height 101.
; PLAN: r0=125(x), r1=123(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=403(x), r6=17(y), r7=72(width), r8=101(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 123
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 403
LDI r6, 17
LDI r7, 72
LDI r8, 101
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
