; DESCRIPTION: Composite: Sets a single orange pixel at (36, 176) then Draws a cyan rectangle at (328, 68) with width 97 and height 16.
; PLAN: r0=36(x), r1=176(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=68(y), r7=97(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 36
LDI r1, 176
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 328
LDI r6, 68
LDI r7, 97
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
