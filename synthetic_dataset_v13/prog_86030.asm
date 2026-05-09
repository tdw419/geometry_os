; DESCRIPTION: Composite: Places a yellow dot at position (129, 157) then Draws a red rectangle at (437, 160) with width 46 and height 23.
; PLAN: r0=129(x), r1=157(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=437(x), r6=160(y), r7=46(width), r8=23(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 157
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 437
LDI r6, 160
LDI r7, 46
LDI r8, 23
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
