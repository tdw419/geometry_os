; DESCRIPTION: Composite: Places a green dot at position (84, 144) then Places a orange 88x20 rectangle at position (393, 30).
; PLAN: r0=84(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=393(x), r6=30(y), r7=88(width), r8=20(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 144
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 393
LDI r6, 30
LDI r7, 88
LDI r8, 20
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
