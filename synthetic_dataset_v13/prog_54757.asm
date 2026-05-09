; DESCRIPTION: Composite: Places a black dot at position (364, 220) then Draws a blue rectangle at (344, 120) with width 60 and height 26.
; PLAN: r0=364(x), r1=220(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=120(y), r7=60(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 220
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 344
LDI r6, 120
LDI r7, 60
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
