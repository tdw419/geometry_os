; DESCRIPTION: Composite: Places a yellow dot at position (296, 132) then Draws a white rectangle at (452, 38) with width 42 and height 24.
; PLAN: r0=296(x), r1=132(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=452(x), r6=38(y), r7=42(width), r8=24(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 132
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 452
LDI r6, 38
LDI r7, 42
LDI r8, 24
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
