; DESCRIPTION: Composite: Sets a single black pixel at (196, 30) then Draws a white rectangle at (162, 231) with width 65 and height 19.
; PLAN: r0=196(x), r1=30(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=231(y), r7=65(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 30
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 162
LDI r6, 231
LDI r7, 65
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
