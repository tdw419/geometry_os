; DESCRIPTION: Composite: Places a magenta dot at position (92, 245) then Draws a cyan rectangle at (231, 160) with width 108 and height 50.
; PLAN: r0=92(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=160(y), r7=108(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 231
LDI r6, 160
LDI r7, 108
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
