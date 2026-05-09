; DESCRIPTION: Composite: Places a green dot at position (241, 188) then Draws a cyan rectangle at (8, 52) with width 34 and height 82.
; PLAN: r0=241(x), r1=188(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=8(x), r6=52(y), r7=34(width), r8=82(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 188
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 8
LDI r6, 52
LDI r7, 34
LDI r8, 82
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
