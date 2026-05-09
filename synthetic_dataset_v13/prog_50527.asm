; DESCRIPTION: Composite: Places a green dot at position (307, 128) then Draws a yellow rectangle at (382, 167) with width 60 and height 83.
; PLAN: r0=307(x), r1=128(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=167(y), r7=60(width), r8=83(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 128
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 382
LDI r6, 167
LDI r7, 60
LDI r8, 83
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
