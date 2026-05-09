; DESCRIPTION: Composite: Places a purple dot at position (90, 0) then Draws a black rectangle at (313, 34) with width 37 and height 111.
; PLAN: r0=90(x), r1=0(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=313(x), r6=34(y), r7=37(width), r8=111(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 0
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 313
LDI r6, 34
LDI r7, 37
LDI r8, 111
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
