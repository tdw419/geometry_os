; DESCRIPTION: Composite: Places a orange dot at position (188, 253) then Draws a yellow rectangle at (42, 119) with width 58 and height 70.
; PLAN: r0=188(x), r1=253(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=119(y), r7=58(width), r8=70(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 253
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 42
LDI r6, 119
LDI r7, 58
LDI r8, 70
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
