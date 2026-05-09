; DESCRIPTION: Composite: Places a cyan dot at position (229, 160) then Draws a red rectangle at (292, 102) with width 76 and height 103.
; PLAN: r0=229(x), r1=160(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=102(y), r7=76(width), r8=103(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 160
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 102
LDI r7, 76
LDI r8, 103
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
