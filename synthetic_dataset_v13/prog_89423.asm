; DESCRIPTION: Composite: Places a green dot at position (58, 25) then Draws a magenta rectangle at (68, 42) with width 28 and height 117.
; PLAN: r0=58(x), r1=25(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=42(y), r7=28(width), r8=117(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 25
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 68
LDI r6, 42
LDI r7, 28
LDI r8, 117
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
