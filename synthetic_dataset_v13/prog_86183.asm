; DESCRIPTION: Composite: Places a purple dot at position (294, 7) then Draws a black rectangle at (231, 13) with width 52 and height 99.
; PLAN: r0=294(x), r1=7(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=13(y), r7=52(width), r8=99(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 7
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 231
LDI r6, 13
LDI r7, 52
LDI r8, 99
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
