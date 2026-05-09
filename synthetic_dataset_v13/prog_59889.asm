; DESCRIPTION: Composite: Places a blue dot at position (158, 83) then Renders a orange box of size 14x24 starting at (344, 15).
; PLAN: r0=158(x), r1=83(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=15(y), r7=14(width), r8=24(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 83
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 15
LDI r7, 14
LDI r8, 24
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
