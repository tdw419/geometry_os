; DESCRIPTION: Composite: Places a cyan dot at position (146, 162) then Draws a green rectangle at (171, 123) with width 49 and height 59.
; PLAN: r0=146(x), r1=162(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=123(y), r7=49(width), r8=59(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 162
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 171
LDI r6, 123
LDI r7, 49
LDI r8, 59
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
