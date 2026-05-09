; DESCRIPTION: Composite: Sets a single cyan pixel at (278, 122) then Renders a blue box of size 54x54 starting at (371, 63).
; PLAN: r0=278(x), r1=122(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=371(x), r6=63(y), r7=54(width), r8=54(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 122
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 371
LDI r6, 63
LDI r7, 54
LDI r8, 54
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
