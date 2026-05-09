; DESCRIPTION: Composite: Places a cyan circle of radius 53 at center (319, 147) then Draws a magenta rectangle at (356, 51) with width 48 and height 26.
; PLAN: r0=319(x), r1=147(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=51(y), r7=48(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 147
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 51
LDI r7, 48
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
