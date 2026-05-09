; DESCRIPTION: Composite: Places a yellow dot at position (111, 21) then Draws a black rectangle at (350, 107) with width 53 and height 18.
; PLAN: r0=111(x), r1=21(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=107(y), r7=53(width), r8=18(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 21
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 350
LDI r6, 107
LDI r7, 53
LDI r8, 18
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
