; DESCRIPTION: Composite: Places a cyan dot at position (65, 7) then Draws a yellow rectangle at (344, 131) with width 38 and height 101.
; PLAN: r0=65(x), r1=7(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=131(y), r7=38(width), r8=101(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 7
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 131
LDI r7, 38
LDI r8, 101
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
