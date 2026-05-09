; DESCRIPTION: Composite: Places a yellow dot at position (333, 4) then Draws a white rectangle at (340, 42) with width 118 and height 90.
; PLAN: r0=333(x), r1=4(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=42(y), r7=118(width), r8=90(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 4
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 340
LDI r6, 42
LDI r7, 118
LDI r8, 90
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
