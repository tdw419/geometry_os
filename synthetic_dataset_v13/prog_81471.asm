; DESCRIPTION: Composite: Places a cyan dot at position (388, 34) then Draws a magenta rectangle at (456, 102) with width 46 and height 41 then Places a red circle of radius 16 at center (183, 61).
; PLAN: r0=388(x), r1=34(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=456(x), r6=102(y), r7=46(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=183(x), r11=61(y), r12=16(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 388
LDI r1, 34
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 456
LDI r6, 102
LDI r7, 46
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 61
LDI r12, 16
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
